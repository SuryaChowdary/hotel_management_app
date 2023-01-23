class SessionsController < ApplicationController

  # Create a new session on each login or signup
  def new
  end

  # Create a new session by finding a user by email and authenticating the password. If unsuccessfull redirect the user to homepage
  def create
   user= User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  # Destroy the current session by setting the user's id in the session to nil and redirect to the root path.
  def destroy
   session[:user_id] = nil
   flash[:notice] = "Logged out successfully"
   redirect_to root_path
  end

end