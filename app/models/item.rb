class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :delivery_free_id
    validates :prefecture_id
    validates :days_ship_id
    validates :price , numericality:{greater_than: 300 , less_than:9999999 ,only_integer: true ,message:"販売価格は半角数字で300円〜9,999,999円の間で入力ください"}
    validates :image
  end

  has_one_attached :image
  belomgs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_free
  belongs_to :prefecture
  belongs_to :days_ship
end
