class SessionsController < ApplicationController

  def new
  end

  def create
    user = Authentication.authenticate(params[:email], params[:password])

    reset_session
    session[:user_id] = user.id

    redirect_to "/"
  end
end