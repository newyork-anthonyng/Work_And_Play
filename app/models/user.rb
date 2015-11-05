class User < ActiveRecord::Base
  has_secure_password

  has_many :tasks
  has_many :likes, through: :tasks
end
