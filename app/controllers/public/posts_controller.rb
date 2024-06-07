class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end
  
  
  private
  def post_params
    params.require.permit(:title, :body)
  end
  
end
