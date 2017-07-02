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
    redirect_to root_path if logged_in?
  end

  def require_logged_user
    return if logged_in?

    url = request.fullpath if request.get?

    redirect_to login_path(return_to: url), alert: t("login.you_must_be_logged_in")
  end
end
