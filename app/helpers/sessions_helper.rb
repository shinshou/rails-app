module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end
  #現在ログイン中のユーザーを返す。
  def current_user
    if session[:user_id]
      #@current_userに値がない場合右辺を代入。
      current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #引数で受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す。
  def current_user?(user)
    user == current_user
  end

  #ユーザーがログインしていればtrue、その他ならfalse。
  def logged_in?
    !current_user.nil?
  end
end
