class AccountsController < ApplicationController

  get '/accounts' do
    if logged_in?
      @accounts = Account.all
      @user = User.find_by(session[:id])
      erb :'accounts/index'
    else
      redirect 'login'
    end
  end

  # Create
  get "/accounts/new" do
    if !logged_in?
      redirect '/login'
    else
      @stocks = Stock.all
      erb :'accounts/new'
    end
  end

  post '/accounts' do
    @account = Account.new(params[:account])
    if @account.save
      session[:id] = @account.id
      if params[:stock][:name] != ""
        @account.stock.create(params[:account][:stock])
      end
      @account.save
      redirect "/accounts/#{@account.id}"
    else
      redirect '/signup'
    end
  end

  get "/accounts/:id" do
    if !logged_in?
      redirect '/login'
    else
      @account = Account.find(params[:id])
      erb :'accounts/show'
    end
  end

  # Update
  get "/accounts/:id/edit" do
    if !logged_in?
      redirect '/login'
    else
      @account = Account.find(params[:id])
      erb :'accounts/edit'
    end
  end

  patch "/accounts/:id" do
    if !logged_in?
      redirect '/login'
    else
      @account = Account.find(params[:id])
      unless Account.valid_params?(params)
        redirect "/accounts/#{@account.id}/edit"
      end
      @account.update
      redirect "/accounts/#{@account.id}"
    end
  end

  # Delete
  delete '/accounts/:id/delete' do
    if logged_in?
      @account = Account.find_by(params[:id])
      if @account
        @account.delete
        redirect '/accounts'
      else
        redirect '/login'
      end
    end
  end
  
end
