# Merchant model, populated from known list in database seed
class Merchant < ApplicationRecord
  validates :name, presence: true
end
