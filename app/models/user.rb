class User < ActiveRecord::Base
  has_secure_password

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
