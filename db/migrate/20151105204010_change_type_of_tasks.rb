class ChangeTypeOfTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :type, :category
  end
end
