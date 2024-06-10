class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def my_page
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      redirect_to users_my_page_path
    else
      @user = User.find(params[:id])
    end
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
