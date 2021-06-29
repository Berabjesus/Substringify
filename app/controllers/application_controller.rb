class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  private

  def access_control
    redirect_to sessions_path, alert: 'You are not logged in' unless session_exists? && current_user
  end

  def current_user
    User.find_by(id: get_session) unless get_session.nil?
  end

  def create_session(user_id)
    session[session_name] = user_id
  end

  def session_exists?
    session[session_name].present?
  end

  def get_session
    session[session_name]
  end

  def session_name
    :substringify_session_token
  end

end
