class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post

  def upvote
    VoteService.new(current_user, @post).upvote
    render 'posts/show.json'
  end

  def downvote
    VoteService.new(current_user, @post).downvote
    render 'posts/show.json'
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end
end
