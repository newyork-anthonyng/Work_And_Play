class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = 'Logged in'
      redirect_to user_path(user)
    else
      flash.notice = 'Passwords dont match'
      redirect_to welcome_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end

end
