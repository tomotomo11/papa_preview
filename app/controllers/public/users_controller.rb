class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @posts = @user.posts.page(params[:page]).per(8)
  end

  def mypage
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(8)
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :email)
  end

end
