class Vote < ActiveRecord::Base
  UPVOTE   = 'upote'
  DOWNVOTE = 'downvote'

  belongs_to :user
  belongs_to :post
end
