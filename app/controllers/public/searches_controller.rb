class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    #キーワード検索
    @range = params[:range]
    @keyword = params[:keyword]
    @post_comments = PostComment.all

    if @range == "Post"
      @posts = Post.search(@keyword)
    else
      @users = User.search(@keyword)
    end

    render'public/searches/index'
  end
end
