class TradeAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id, :trade_id
  with_options presence: true do
    validates :postal_code ,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角数字のみで (-) も入力してください"}
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number, numericality: {only_integer: true, message:"数字のみで入力してください"}

  end

  def save
    trade = Trade.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, trade_id: trade.id)
  end

end