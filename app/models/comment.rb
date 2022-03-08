class Comment < ApplicationRecord
  belongs_to :board

  # presence: trueで入力必須。
  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000}
end
