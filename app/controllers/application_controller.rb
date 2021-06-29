class ApplicationController < ActionController::Base

  def create_session(user_id)
    session[session_name] = user_id
  end

  def get_session
    session[session_name]
  end

  def session_name
    :substringify_session_token
  end

end
