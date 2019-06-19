require 'rails_helper'

RSpec.describe 'transactions/new', type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
                           merchant_id: Merchant.create(name: 'Uber').id,
                           description: 'MyString'
                         ))
  end

  it 'renders new transaction form' do
    render

    assert_select 'form[action=?][method=?]', transactions_path, 'post' do
      assert_select 'input[name=?]', 'transaction[description]'
    end
  end
end
