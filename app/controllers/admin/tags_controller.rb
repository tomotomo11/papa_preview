class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @tag = Tag.new(tag_params)
    @tags = Tag.all
    if @tag.save
      flash[:notice] = "成功"
    else
      flash.now[:alert] = "失敗"
    end
  end

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def destroy
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag.destroy
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
