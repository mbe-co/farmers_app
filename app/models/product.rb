class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :name, uniqueness: true

  enum status: { active: 0, inactive: 1 }, _default: 0

  def status_name
    Product.human_attribute_name("status.#{status}")
  end

  def sanitize_name
    name.downcase!
  end
end
