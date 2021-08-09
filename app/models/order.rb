class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products,  through: :order_products
#to the future, validate that due_date is greater than purchase_date
  validates :purchase_date, presence: true
  validates :due_date, presence: true
end
