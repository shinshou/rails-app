class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

  #ログイン済みユーザーかどうか確認。
  def logged_in_user
    unless logged_in?
      flash[:alert] = "ログインしてください。"
      redirect_to root_path
    end
  end

end
