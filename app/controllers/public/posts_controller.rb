class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    @genres = Genre.all
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts
    end

    if params[:tag_ids].present?
      @posts = @posts.joins(:tag_relationships).where(tag_relationships: {tag_id: params[:tag_ids]}).distinct
    end

    @posts = @posts.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @tags = Tag.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @genre = Genre.all
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "変更を保存しました。"
    else
      flash[:alert] = "変更を保存できませんでした。"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to mypage_path
    else
      flash[:alert] = "投稿を削除できませんでした。"
      redirect_to post_path(post.id)
    end
  end


  private

  def post_params
    params.require(:post).permit(:image, :name, :title, :body, :genre_id, :price, :star, tag_ids: [])
  end

end
