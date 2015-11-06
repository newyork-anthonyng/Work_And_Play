class UsersController < ApplicationController
  before_action :authorize, except: :create

  def index
    @users = User.all.order(:fname)
    @users_score = 0
    @users.each do |user|
      @users_score += user.score
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.notice = "Username created."
      session[:user_id] = @user.id
      flash.notice = 'Logged in'
      redirect_to user_path(@user)
    else
      render "sessions/new"
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id
      redirect_to home_path
    else
      @play_tasks = @user.tasks.where(category: "play").order(:description)
      @work_tasks = @user.tasks.where(category: "work").order(:description)
    end
  end

  def home
    @user = current_user
    @play_tasks = @user.tasks.where(category: "play").order(:description)
    @work_tasks = @user.tasks.where(category: "work").order(:description)
  end

  private
    def user_params
      params.require(:user).permit(
        :fname,
        :lname,
        :email,
        :password,
        :password_confirmation
      )
    end

end
