class User < ApplicationRecord
  has_secure_password

  #ユーザー名に対するバリデーションの設定。
  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }

  #パスワードに対するバリデーションの設定。
  validates :password,
    length: { minimum: 8 }
end
