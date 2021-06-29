class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.valid? && @user.save
      create_session @user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid input please sign in again."
      render 'sessions/new'
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
