class CommentsController < ApplicationController
  def create
    # commentオブジェクトを作成、フォームから受け取った値(comment_params)で初期化
    comment = Comment.new(comment_params)
    if comment.save #.saveでデータベースに保存する
      flash[:notice] = 'コメントを投稿しました。'
      redirect_to comment.board
    else
      redirect_to :back, flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }#:backで１つ前の画面に戻る。
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
