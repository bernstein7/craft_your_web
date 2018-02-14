class Company < ApplicationRecord
  has_many :company_positions
  has_many :users, through: :company_positions
end
