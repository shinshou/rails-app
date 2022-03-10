class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name
    ])#ユーザー名の検索該当なしの場合はnil
    if user && user.authenticate(params[:session][:password])
      #渡されたユーザー名でパスワードを検索、ヒットすればクライアントのセッションにidを保存してマイページへレンダリング。
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
