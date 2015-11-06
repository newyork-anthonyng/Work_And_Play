class SessionsController < ApplicationController

  def new
    if current_user
      # redirect to homepage if user is logged in
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      # successful login
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.notice = 'The email/password you\'ve entered is incorrect'
      redirect_to welcome_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end

end
