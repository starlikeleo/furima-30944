class BuyDestination

  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :delivery_area_id, :municipal_name, :house_number, :building_name, :tell

  #切り取ったバリデーションをここに移動
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipal_name
    validates :house_number
    validates :tell
  end

  def save
    buy = Buys.create(user_id: buys.user_id, item_id: params[:item_id])
    Destination.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipal_name: municipal_name, house_number: house_number, tell: tell)
  end

end