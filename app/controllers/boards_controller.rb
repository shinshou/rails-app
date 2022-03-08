#ApplicationControllerクラスを継承してBoardsControllerクラスを作成。
class BoardsController < ApplicationController
  #各アクションが実行される前に実行したいメソッドを記述する。before_action
  # onlyで適応するアクションを記述している。
  before_action :set_target_board, only: %i[show edit update destroy]

  #BoardsControllerのindexアクションと呼ぶこともある。
  def index
    #パラメータにタグIDがあれば、boardsテーブルから該当するタグIDのの記事を表示する。
    #パラメータにタグIDがなければ、boardsテーブルから全件を表示する。 
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    #Board.allでboardsテーブルにあるデータをすべて取得して、@boards変数に格納している。@boardsはindex.html.erbで参照できる。
    @boards = @boards.page(params[:page])#kaminariを追加したことでモデルに対して.pageメソッドが使えるようになる。デフォルトでは２５件の表示をする。
  end

  def new
    #Boardモデルのオブジェクトを作成して、@boardというインスタンス変数に格納。
    #コントローラー内で定義したインスタンス変数はビューでも参照することができる。（new.html.erbで参照できる。）
    @board = Board.new(flash[:board])
  end

  def create
    #createメソッドに保存するパラメータを渡すことでデータベースに保存できる。
    board = Board.new(board_params)
    if board.save
      # flash変数参照されるまでセッションに保存される変数。
      flash["notice"] = "「#{board.title}」の掲示板を作成しました。"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
    
  end

  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)
    if board.save
      # flash変数参照されるまでセッションに保存される変数。
      flash["notice"] = "「#{board.title}」の掲示板を編集しました。"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
    # redirect_to @board
  end

  def destroy
    @board.destroy
    redirect_to boards_path,flash:{ notice: "「#{@board.title}」の掲示板が削除されました。"}
  end


  private

  def board_params
    #このメソッドでparamsの中のboardプロパティにあるname,title,bodyの値のみを取得することができる。
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end
