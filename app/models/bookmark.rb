class Bookmark < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :post_id, uniqueness: true, presence: true
end
