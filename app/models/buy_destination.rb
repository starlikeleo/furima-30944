class BuyDestination

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :delivery_area_id, :municipal_name, :house_number, :building_name, :tell, :token

  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :delivery_area_id,  numericality: { other_than: 0, message: "can't be blank" }
    validates :house_number
    validates :item
    validates :municipal_name
    validates :postal_code,       format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :tell,              format: { with: VALID_PHONE_NUMBER_REGEX }
    validates :user
    validates :token
  end

  def save
    buy = Buy.create(user_id: user, item_id: item)
    Destination.create(buy_id: buy.id, postal_code: postal_code, delivery_area_id: delivery_area_id, municipal_name: municipal_name, house_number: house_number, tell: tell)
  end
end