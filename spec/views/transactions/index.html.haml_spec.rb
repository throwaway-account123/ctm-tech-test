require 'rails_helper'

RSpec.describe 'transactions/index', type: :view do
  before(:each) do
    assign(:transactions, [
             Transaction.create!(
               description: 'Description'
             ),
             Transaction.create!(
               description: 'Description'
             )
           ])
  end

  it 'renders a list of transactions' do
    render
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
  end
end
