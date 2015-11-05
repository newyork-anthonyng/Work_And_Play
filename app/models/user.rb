class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :likes, through: :posts
end
