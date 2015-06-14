class SearchesController < ApplicationController
  def create
    @posts = Post.where("tags && ?", "{#{sanitized_search_params.join(',')}}")
    Search.create(query: sanitized_search_params.join(', '), results_count: @posts.count)
  end

  def tags
    @posts = Post.where("tags && ?", "{#{tag}}")
    Search.create(query: tag, results_count: @posts.count, tag: true)
    render action: :create
  end

  private

  def sanitized_search_params
    params.permit(:query)[:query].strip.downcase.split
  end

  def tag
    params.permit(:tag)[:tag]
  end
end
