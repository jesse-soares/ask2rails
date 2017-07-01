class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # enable methods into views
  helper_method :current_user, :logged_in?

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def redirect_logged_user
    redirect_to "/" if logged_in?
  end
end
