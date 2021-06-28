class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    p @user.id
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
