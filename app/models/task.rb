class Task < ActiveRecord::Base
  belongs_to :user

  has_many :likes
  
  has_many :taggings
  has_many :tags, through: :taggings
end
