# Merchant model, populated from known list in database seed
class Merchant < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
end
