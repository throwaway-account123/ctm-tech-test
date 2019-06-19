require 'rails_helper'

RSpec.describe 'transactions/edit', type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
                                          merchant_id: Merchant.create(name: 'Uber').id,
                                          description: 'MyString'
                                        ))
  end

  it 'renders the edit transaction form' do
    render

    assert_select 'form[action=?][method=?]', transaction_path(@transaction), 'post' do
      assert_select 'input[name=?]', 'transaction[description]'
    end
  end
end
