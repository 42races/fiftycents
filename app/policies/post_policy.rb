class PostPolicy

  def initialize(user, post)
    @user = user
    @post = post
  end

  def already_bookmarked?
    @user.bookmarks.where(post_id: @post.id).size != 0
  end
end
