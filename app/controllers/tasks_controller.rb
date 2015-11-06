class TasksController < ApplicationController
  before_action :authorize

  def index
    @play_tasks = Task.all.where(category: "play")
    @work_tasks = Task.all.where(category: "work")
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(task_params)

    # "play" = +1, "work" = -1
    @task.points = @task.category == "play" ? 1 : -1
    @task.save

    redirect_to user_path(@user)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      @task.points = @task.category == "play" ? 1 : -1
      @task.save
      flash.notice = "task updated"
      redirect_to user_path(@task.user)
    end
  end

  def complete
    @task = Task.find(params[:id])

    @task.completed = true
    @task.save

    flash.notice = "Task marked as completed"
    redirect_to user_path(@task.user)
  end

  def destroy
    @task = Task.find(params[:id])
    @user = User.find(params[:user_id])

    @task.destroy
    flash.notice = "\'#{@task.description} \' deleted."
    redirect_to user_path(@user)
  end

  def like
    @task = Task.find(params[:id])
    @task.liked_by current_user

    redirect_to :back
  end

  private
    def task_params
      params.require(:task).permit(
        :description,
        :category,
        :points,
        :completed,
        :tag_list
      )
    end
end
