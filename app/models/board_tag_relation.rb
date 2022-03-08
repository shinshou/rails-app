class BoardTagRelation < ApplicationRecord
  belongs_to :board #board modelのIDを紐付いている。
  belongs_to :tag #tag modelのIDと紐付いている。
end
