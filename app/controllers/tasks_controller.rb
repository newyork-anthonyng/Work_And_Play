class TasksController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(task_params)
    redirect_to user_path(@task.user)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash.notice = "Task updated"
      redirect_to user_path(@task.user)
    else
      flash.notice = "Error in updating task"
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save

    @user = User.find(params[:user_id])
    flash.notice = "Task marked as completed"
    redirect_to user_path(@user)
  end

  def destroy
    @task = Task.find(params[:id])
    @user = User.find(params[:user_id])

    @task.destroy
    flash.notice = "\'#{@task.description} \' deleted."
    redirect_to user_path(@user)
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
