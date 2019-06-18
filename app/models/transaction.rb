# User submitted transactions
class Transaction < ApplicationRecord
  belongs_to :merchant

  validates :description, presence: true

  # Retrieve a relevant merchant from the existing list
  # if it is mentioned by name in the description text
  # Otherwise, create a new unknown merchant
  def prepare_merchant
    # Priority by name
    # 'Uber Eats' takes priority over 'Uber'
    # 'Amazon Prime' > 'Amazon'
    merchants = Merchant
                .all
                .to_a
                .select { |m| description.tr("'", '').downcase.include?(m.name.downcase) }
                .sort { |m| m.name.length }

    # If no merchants were matched, create one instead
    merchants.present? ? merchants.first : Merchant.create(name: 'unknown')
  end
end
