class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update , :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update , :destroy]

   # Show all the users
   def index
    @users = User.all
  end

  # Create a new user
  def new 
    @user = User.new
  end 

  # Save the user's information when signup
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Hotel Application #{@user.username} You've successfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  # Edit the user's information
  def edit
  end

  # Update the user's information
  def update
    if @user.update(user_params)  
      flash[:notice]= "User is updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Show the user's information
  def show
  end

  # Delete the user's account
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to clients_path
  end

  private

  #private method to pass user parameters to permit the user's information
  def user_params
    params.require(:user).permit(:username , :email, :password)
  end

  # private method to set the user's instance variable
  def set_user
    @user = User.find(params[:id])
  end

  # private method to ensure that the user can only edit or delete their own account
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end

end
