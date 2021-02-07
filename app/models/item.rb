class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_date_id
    validates :prise
  end

  belongs_to:user
  has_one_attached :image
end