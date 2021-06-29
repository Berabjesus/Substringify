class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      create_session @user.id
      # redirect_to
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
