class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])#flashで渡したユーザーオブジェクトを登録フォームに渡す。バリデーションエラーがあった場合に値が保持されたまま登録フォームに戻る。
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id #session変数を使用。アクセスしてきたユーザーのセッションにIDを保存。
      redirect_to mypage_path
    else
      flash[:error_messages] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def me
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
