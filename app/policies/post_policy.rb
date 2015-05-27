class PostPolicy

  def initialize(user, post)
    @user = user
    @post = post
  end

  def already_bookmarked?
    @user && @user.bookmarks.where(post_id: @post.id).size != 0
  end

  def upvote?
    vote = Vote.where(user: @user, post: @post).first
    return true unless vote
    (vote.status == Vote::DOWNVOTE) ? true : false
  end

  def downvote?
    vote = Vote.where(user: @user, post: @post).first
    return true unless vote
    (vote.status == Vote::UPVOTE) ? true : false
  end
end
