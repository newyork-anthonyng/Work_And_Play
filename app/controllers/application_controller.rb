class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if !current_user
      flash.notice = "Please log in first."
      redirect_to welcome_path
    end
  end
  helper_method :authorize

  def is_current_user?(user)
    current_user.id == user.id
  end
  helper_method :is_current_user?

end
