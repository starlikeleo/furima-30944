class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :encrypted_password, :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴ]/ } do
    validates :kana_family_name
    validates :kana_first_name
  end

  validates :birthday, presence: true
end
