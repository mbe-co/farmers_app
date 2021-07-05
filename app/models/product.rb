class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :name, uniqueness: true

  enum status: [:active, :inactive]
end
