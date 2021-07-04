class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, presence: true
  validates :phone, numericality: { only_integer: true }

  enum status: [:active, :inactive, :blocked]

  has_one :address
end
