class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def user_index
    @user = User.find(params[:id])
    @user_tags = @user.tasks.collect do |task|
      task.tags
    end.flatten
  end

end
