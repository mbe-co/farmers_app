class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  enum role: { operator: 0, admin: 1 }
end
