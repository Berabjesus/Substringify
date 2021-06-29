class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])
    if @user&.authenticate(session_params[:password])
      create_session @user.id
      redirect_to root_path
    else
      flash[:alert] = "Username or password not found."
      render :new
    end
  end

  def destroy
    session.delete(:substringify_session_token)
    redirect_to root_path, alert: 'Your Logged out.'
  end

  def session_params
    params.permit(:username, :password, :password_confirmation)
  end

end