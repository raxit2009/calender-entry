class SessionsController < ApplicationController
  before_filter :onlogin, :only => :new
  
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, :notice => "Invalid email or password"
    end
  end
  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, :notice => "Logged out!"
  end
end
