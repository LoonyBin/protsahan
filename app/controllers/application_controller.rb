class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # TODO: create more controlled authorization
  def authenticate
    unless current_user
      session[:redirected_from] = request.env['PATH_INFO']
      redirect_to new_session_url
      return false
    end
  end
end
