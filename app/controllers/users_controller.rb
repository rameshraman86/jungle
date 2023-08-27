class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to root_path
    else
      redirect_to new_user_path, alert: "Unable to register."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
