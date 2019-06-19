require 'rails_helper'

RSpec.describe 'transactions/show', type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
                                          merchant_id: Merchant.create(name: 'Uber').id,
                                          description: 'Description'
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Description/)
  end
end
