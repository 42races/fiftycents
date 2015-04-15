class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies, foreign_key: :reply_to

  attr_accessor :tag_string

  scope :all_posts, -> {  where(reply_to: nil) }

  def set_tags!(args)
    str = args[:tag_string]
    return if str.strip.empty?
    self.tags = str.squish.split(/\s|,/)
  end

  def set_tag_string!
    self.tag_string = tags.join(' ')
  end

  def upvote!
    update_attribute(:upvote, self.upvote + 1)
  end

  def downvote!
    update_attribute(:downvote, self.downvote + 1)
  end
end
