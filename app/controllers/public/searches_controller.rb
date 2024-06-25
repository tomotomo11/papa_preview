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

    #タグ検索
    @tag_ids = params[:tag_ids]&.select(&:present?)
    if @tag_ids.present?
      @tag_word = "タグ: "
      @tag_ids.each do |id|
        @tag_word = @tag_word + ' ' + Tag.find(id).name if id != ""
      end
      @posts = @posts.joins(:tag_relationships).where(tag_relationships: {tag_id: @tag_ids}).group("posts.id").having("count(*) = #{@tag_ids.length}")
    end

  end
end
