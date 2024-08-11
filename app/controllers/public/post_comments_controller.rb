class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = "コメントしました。"
      respond_to do |format|
        format.js
        format.html { redirect_to post_path(@post) }
      end
    else
      flash[:alert] = "コメントできませんでした。"
      respond_to do |format|
        format.js
        format.html { redirect_to post_path(@post), alert: "コメントの投稿に失敗しました。" }
      end
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    respond_to do |format|
      format.js
      format.html { redirect_to post_path(@post), notice: "コメントを削除しました。" }
    end
  end


  private
  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end
