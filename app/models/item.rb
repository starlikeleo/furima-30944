class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_date_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_date_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
      greater_than: 299, less_than: 10000000
      }
  end

end