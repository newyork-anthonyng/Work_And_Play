class Tagging < ActiveRecord::Base
  belongs_to :tasks
  belongs_to :tag
end
