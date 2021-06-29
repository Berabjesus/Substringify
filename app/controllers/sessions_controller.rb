class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])
    if @user&.authenticate(session_params[:password])
      create_session @user.id
      redirect_to input_index_path
    else
      # redirect_to articles_path, alert: 'Username or password not found'
    end
  end

  def destroy

  end

  def session_params
    params.permit(:username, :password, :password_confirmation)
  end

end