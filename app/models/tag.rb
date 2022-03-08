class Tag < ApplicationRecord
  #多対多の関係では、
  #中間テーブルとのひも付きと
  #中間テーブルを経由して紐づく関係の定義が必要。
  #has_manyの指定では、モデルはすべて複数形で指定する。
  has_many :board_tag_relations, dependent: :delete_all
  has_many :boards, through: :board_tag_relations
end
