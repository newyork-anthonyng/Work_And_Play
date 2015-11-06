class UsersController < ApplicationController

  def index
    @users = User.all
    @users_score = 0
    @users.each do |user|
      @users_score += user.score
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.notice = "Username created."
      redirect_to user_path(@user)
    else
      flash.notice = "Failed. Username not created."
      redirect_to welcome_path
    end
  end

  def show
    @user = User.find(params[:id])
    @play_tasks = @user.tasks.where(category: "play")
    @work_tasks = @user.tasks.where(category: "work")
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
