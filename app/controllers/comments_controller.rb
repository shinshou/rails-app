class CommentsController < ApplicationController
  #ログイン済みユーザーのみが掲示板の操作をできるようにする。
  before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy]

  def create
    # commentオブジェクトを作成、フォームから受け取った値(comment_params)で初期化
    comment = Comment.new(comment_params)
    if comment.save #.saveでデータベースに保存する
      flash[:notice] = 'コメントを投稿しました。'
      redirect_to comment.board
    else
      flash[:error_messages] = comment.errors.full_messages
      redirect_to comment.board
    end
  end


  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました。 '}
  end

  # ストロングパラメータの設定
  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
