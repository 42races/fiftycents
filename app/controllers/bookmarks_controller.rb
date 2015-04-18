class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: [:create, :destroy]

  def index
    ids = current_user.bookmarks.select(:post_id).to_a.collect(&:post_id)
    @posts = Post.find(ids)
  end

  def create
    bm = current_user.bookmarks.new(post: @post)

    if bm.save
      render json: { status: true, id: @post.id }
    else
      render json: { status: false, message: bm.errors.full_messages }
    end
  end

  def destroy
    bm = current_user.bookmarks.where(post_id: @post.id).first

    if bm.present?
      bm.destroy!
      render json: { status: true, id: @post.id }
    else
      render json: { status: false, message: 'Bookmark not found' }
    end
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end
end
