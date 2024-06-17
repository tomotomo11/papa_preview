class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @keyword = params[:keyword]

    if @range == "Post"
      @posts = Post.search(@keyword)
    else
      @users = User.search(@keyword)
    end

    render'public/searches/index'
  end
end
