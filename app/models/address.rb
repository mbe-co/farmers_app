class Address < ApplicationRecord
  belongs_to :customer

  validates :street, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :cep, presence: true
end
