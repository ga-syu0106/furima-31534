class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname        , presence: true
  validates :password        , presence: true , format: { with: /\A[a-zA-Z0-9]+[a-zA-Z0-9]\z/ , message: "英数字のみで両方使用してください"}
  validates :last_name       , presence: true , format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ , message: '全角文字を使用してください' }
  validates :first_name      , presence: true , format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ , message: '全角文字を使用してください' }
  validates :last_name_kana  , presence: true , format: { with: /\A[ァ-ヶ]+\z/ , message: '全角カナを使用してください' }
  validates :first_name_kana , presence: true , format: { with: /\A[ァ-ヶ]+\z/ , message: '全角カナを使用してください' }
  validates :birth_date      , presence: true
end
