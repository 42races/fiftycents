class Post < ActiveRecord::Base
  belongs_to :user

  attr_accessor :tag_string

  def set_tags!(args)
    str = args[:tag_string]
    return if str.strip.empty?
    self.tags = str.squish.split(/\s|,/)
  end

  def set_tag_string!
    self.tag_string = tags.join(' ')
  end
end
