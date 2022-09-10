class UsersController < ApplicationController
  def index
    @user = User.where(user_id: current_user.id)
  end

  def welcome; end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
