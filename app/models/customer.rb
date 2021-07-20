class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, presence: true
  validates :phone, numericality: { only_integer: true },
                    allow_nil: true

  enum status: [:active, :inactive, :blocked]

  scope :by_name_or_email, ->(params) { where('name LIKE ? OR email LIKE ?', "%#{params}%", "%#{params}%") }
  scope :by_status, ->(status) { where('status = ?', status) }

  has_one :address

  def status_name
    Customer.human_attribute_name("status.#{status}")
  end
end
