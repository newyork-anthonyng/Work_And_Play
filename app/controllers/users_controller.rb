class UsersController < ApplicationController
  before_action :authorize, except: :create

  def index
    @users = User.all.order(:fname)
    @users_score = @users.map do |user|
      user.score
    end.reduce(:+)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "sessions/new"
    end
  end

  def show
    @user = User.find(params[:id])
    if is_current_user?(@user)
      redirect_to home_path
    else
      set_play_and_work_tasks
    end
  end

  def home
    @user = current_user
    set_play_and_work_tasks
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

    def set_play_and_work_tasks
      @play_tasks = @user.tasks.where(category: "play").order(:description)
      @work_tasks = @user.tasks.where(category: "work").order(:description)
    end

end
