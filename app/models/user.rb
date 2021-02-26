class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴ]/ } do
    validates :kana_family_name
    validates :kana_first_name
  end

  has_many :items
  has_many :buys
end
