class SessionsController < ApplicationController
  before_action :redirect_logged_user, except: [:destroy]

  layout "window"
  
  def new
  end

  def create
    user = Authentication.authenticate(params[:email], params[:password])

    if user
      reset_session
      session[:user_id] = user.id
      return_to = ReturnTo.new(root_path, params[:return_to]).path

      redirect_to return_to
    else
      flash.now[:alert] = t("flash.sessions.create.alert")
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end