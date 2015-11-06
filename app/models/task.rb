class Task < ActiveRecord::Base
  belongs_to :user

  has_many :likes

  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.content
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |content| Tag.find_or_create_by(content: content) }
    self.tags = new_or_found_tags
  end
end
