class AccountsController < ApplicationController

  get '/accounts' do
    if logged_in?       #if user is logged in
      @accounts = Account.all   #load all the user's accounts and assign to instance variable
      @user = User.find_by(session[:id])  #find user and assign it an instance variable
      erb :'accounts/index'
    else
      redirect 'login'
    end
  end

  # Create
  get "/accounts/new" do
    if !logged_in?    #if user isn't logged in
      redirect '/login' #redirect to log in page
    else
      @stocks = Stock.all   #load all the stocks and assign to instance variable for new account setup
      erb :'accounts/new'
    end
  end

  post '/accounts' do
    @account = Account.new(params[:account])  #post user input params to @account
    if @account.save                          #if params are valid, @account will be able to save
      session[:id] = @account.id              #activate session id
      if params[:stock][:name] != ""          #new account must include a stock
        @account.stock.create(params[:account][:stock]) #create a stock
      end
      @account.save                           #save new account
      redirect "/accounts/#{@account.id}"     #send user to new account page
    else
      redirect '/signup'
    end
  end

  get "/accounts/:id" do
    if !logged_in?            #if user not logged in
      redirect '/login'
    else
      @account = Account.find_by(params[:id])     #find account by account id to load that view
      erb :'accounts/show'
    end
  end

  # Update
  get "/accounts/:id/edit" do
    if !logged_in?                #if user not logged in
      redirect '/login'
    else
      @account = Account.find_by(params[:id])   #find account by account id to edit that view
      erb :'accounts/edit'
    end
  end

  patch "/accounts/:id" do
    if !logged_in?            #if not logged in
      redirect '/login'
    else
      @account = Account.find_by(params[:id])   #find account by account id to save view changes
      unless Account.valid_params?(params)      #unless params are valid, redirect user to edit view
        redirect "/accounts/#{@account.id}/edit"
      end
      @account.update                           #correctly filled out params will save changes to view
      redirect "/accounts/#{@account.id}"
    end
  end

  # Delete
  delete '/accounts/:id/delete' do
    if logged_in?                   #if user is logged in
      @account = Account.find_by(params[:id])   #find user account by account id
      if @account           #if account exits
        @account.delete     #account is to be deleted 
        redirect '/accounts'
      else
        redirect '/login'
      end
    end
  end

end
