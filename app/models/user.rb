class User < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  enum role: { operator: 0, admin: 1 }
end
