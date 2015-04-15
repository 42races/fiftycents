class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post

  def upvote
    @post.upvote!
    render 'posts/show.json'
  end

  def downvote
    @post.downvote!
    render 'posts/show.json'
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end
end
