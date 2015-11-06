class User < ActiveRecord::Base
  has_secure_password

  validates :fname, :presence => { message: "first name is missing" }
  validates :lname, :presence => { message: "last name is missing" }
  validates :email, :presence => { message: "email is missing" },
                    :uniqueness => { message: "email is already used" }
  validates :password, :length => { in: 6..20, message: "password has to be between 6 and 20 characters" },
                       :presence => { message: "password can't be blank" }

  has_many :tasks
  has_many :likes, through: :tasks
  def score
    score = 0
    if tasks.size > 0
      tasks.each do |task|
        score += task.points.to_i
      end
    end
    return score
  end

end
