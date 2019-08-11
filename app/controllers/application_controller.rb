require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  # Display login form
  get '/' do
    erb :index
  end

  # Process login form. If user exists, go to account page. Else display error page.
  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  # Display data if user exists. Else display error page. 
  get '/account' do
    @current_user = Helpers.current_user(session)
    if @current_user.nil?
      erb :error
    else 
      erb :account
    end
  end

  # Clear session to log user out
  get '/logout' do
    session.clear
    redirect to '/'
  end

end