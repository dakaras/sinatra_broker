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

  get "/accounts/new" do
    if !logged_in
      redirect '/login'
    else
      erb :'golf_bags/new'
    end
  end

  get "/accounts/:id/edit" do
    if !logged_in
      redirect '/login'
    else
      @account = Account.find(params[:id])
      erb :'accounts/edit'
    end
  end

  post "/accounts/:id" do
    if !logged_in
      redirect '/login'
    else
      @account = Account.find(params[:id])
      unless Account.valid_params?(params)
        redirect "/accounts/#{@account.id}/edit"
      end
      @account.update(params.select{|k|k=="name" || k=="category"})
      redirect "/accounts/#{@account.id}"
    end
  end

  get "/accounts/:id" do
    if !logged_in
      redirect '/login'
    else
      @account = Account.find(params[:id])
      erb :'accounts/show'
    end
  end

  post "/accounts" do
    if !logged_in
      redirect '/login'
    else
      unless Account.valid_params?(params)
        redirect "/accounts/new"
      end
      Accounts.create(params)
      redirect "/accounts"
    end
  end
end
