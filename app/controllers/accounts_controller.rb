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


end
