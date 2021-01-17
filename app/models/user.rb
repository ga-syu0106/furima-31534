class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: PASSWORD_REGEX, message: '半角英数字のみで両方使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナを使用してください' }
    validates :birth_date
  end
end
