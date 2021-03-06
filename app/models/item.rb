class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :delivery_free_id
    validates :prefecture_id
    validates :days_ship_id
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true,
                              message: '半角数字で300円〜9,999,999円の間で入力ください' }
    validates :image
  end

  has_one_attached :image
  belongs_to :user
  has_one :trade

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_free
  belongs_to :prefecture
  belongs_to :days_ship
end
