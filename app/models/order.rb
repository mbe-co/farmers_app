class Order < ApplicationRecord
  belongs_to :customer
#to the future, validate that due_date is greater than purchase_date
  validates :purchase_date, presence: true
  validates :due_date, presence: true
end
