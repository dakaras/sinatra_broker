class UsersController < ApplicationController

  # Allows user to sign up for an account or redirect to '/accounts' resource
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/accounts'
    end
  end

  # Takes user input from create_user view and persists to database if fields are filled
  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/accounts'
    else
      redirect '/signup'
    end
  end

  # If user isn't logged in, send him to the login view or redirect to '/accounts' resource
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/accounts'
    end
  end

  # Verify user login inputs by finding by inputed username. Then authenticate password with bcrypt to redirect to '/accounts' resource. Else redirect to '/signup' resource.
  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #authenticate method provided by bcrypt gem, matches string input with password digest to verify if true.
      session[:user_id] = user.id #if user found and password authenticated, session id is activated.
      redirect '/accounts'
    else
      redirect '/signup'
    end
  end

  # Destory the session when user is navigated to '/logout' resource. Redirect to view matched with '/login' resource.
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
