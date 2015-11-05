class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string      :description
      t.string      :type
      t.integer     :points
      t.boolean     :completed, default: false
      t.references  :user

      t.timestamps
    end
  end
end
