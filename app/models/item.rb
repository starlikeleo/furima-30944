class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :category_id,       numericality: { other_than: 0 } 
  validates :state_id,          numericality: { other_than: 0 }
  validates :delivery_fee_id,   numericality: { other_than: 0 }
  validates :area_id,           numericality: { other_than: 0 }
  validates :delivery_date_id,  numericality: { other_than: 0 }

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_date_id
    validates :price
  end
  
end