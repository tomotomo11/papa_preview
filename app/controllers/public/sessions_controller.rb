# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_user!, expect: [:top, :about]
  before_action :reject_inactive_user, only: [:create]

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def reject_inactive_user #「reject_inactive_user」は、無効な顧客を拒否するために使用するメソッド
    @user = User.find_by(email: params[:user][:email])
    if @user #もしuserレコードが存在するなら「真」
      if @user.valid_password?(params[:user][:password]) && !@user.is_active #パスワードが正しく、かつ顧客が退会している場合
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_user_session_path
      end
    end
  end


end
