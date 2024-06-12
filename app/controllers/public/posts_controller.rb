class Public::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "変更を保存できませんでした。"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to posts_path
    else
      flash[:alert] = "投稿を削除できませんでした。"
      redirect_to post_path(post.id)
    end
  end


  private

  def post_params
    params.require(:post).permit(:image, :name, :title, :body, :genre_id, :price, :star, :tag)
  end

end