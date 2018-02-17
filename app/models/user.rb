class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  has_many :company_positions
  has_many :companies, through: :company_positions
end
