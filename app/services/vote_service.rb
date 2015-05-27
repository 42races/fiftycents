class VoteService
  def initialize(user, post)
    @user = user
    @post = post
  end

  def upvote
    vote.status = Vote::UPVOTE
    vote.save
  end

  def downvote
    vote.status = Vote::DOWNVOTE
    vote.save
  end

  private

  def vote
    @vote ||= Vote.where(user: @user, post: @post).first || Vote.new(user: @user, post: @post)
  end
end
