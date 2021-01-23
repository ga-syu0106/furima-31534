class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_free
  belongs_to :prefecture
  belongs_to :days_ship

  validates :category_id , presence: true
end
