class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params.id)
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
