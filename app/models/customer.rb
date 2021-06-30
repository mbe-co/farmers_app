class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  enum status: [:active, :inactive, :blocked]
  enum authorization: [:regular, :admin, :operator]

  has_one :address
end
