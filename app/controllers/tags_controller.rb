class TagsController < ApplicationController
  before_action :authorize

  def index
    clear_empty_tags
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

  private
    def clear_empty_tags
      @tags = Tag.all

      @tags.each do |tag|
        tag.delete if tag.tasks.empty?
      end
    end

end
