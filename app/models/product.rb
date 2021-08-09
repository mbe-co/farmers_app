class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true
  validates :name, uniqueness: true

  enum status: { active: 0, inactive: 1 }, _default: 0

  before_save :sanitize_name

  def status_name
    Product.human_attribute_name("status.#{status}")
  end

  def sanitize_name
    name.downcase!
  end
end
