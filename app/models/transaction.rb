# User submitted transactions
class Transaction < ApplicationRecord
  validates :description, presence: true
end
