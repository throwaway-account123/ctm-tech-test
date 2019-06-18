# frozen_string_literal: true

require 'rails_helper'

describe MainController, type: :controller do
  describe '#index GET /' do
    it 'responds to request' do
      get :index
      expect(response.status).to be 200
      expect(assigns(:transaction).class).to eq Transaction
    end

    it 'assigns transactions reverse chronologically' do
      merch = Merchant.create(name: 'Uber')
      trans1 = Transaction.create(description: 'my transaction1', merchant_id: merch.id)
      trans2 = Transaction.create(description: 'my transaction2', merchant_id: merch.id)
      get :index
      expect(assigns(:transactions)).to eq [trans2, trans1]
      Transaction.destroy_all
    end
  end
end
