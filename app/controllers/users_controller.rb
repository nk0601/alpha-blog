class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)     #whitelist what we're accepting, pass params hash
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'                # invalid user, then render new template again, display errors from renders partial
    end
  end
  
  private
  def user_params
    params.required(:user).permit(:username, :email, :password)
  end
end