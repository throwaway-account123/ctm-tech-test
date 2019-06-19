require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:merchant) }
  it { is_expected.to validate_presence_of(:description) }

  describe '#prepare_merchant' do
    after :each do
      Transaction.destroy_all
      Merchant.destroy_all
    end

    it 'returns relevant merchant if matching description text' do
      expected = Merchant.create(name: 'Uber')
      transaction = Transaction.new(description: 'Uber and some other text')
      merchant = transaction.prepare_merchant
      expect(merchant).to eq expected
    end

    it 'prioritises longer name if multiple merchants matching description text' do
      Merchant.create(name: 'Uber')
      expected = Merchant.create(name: 'Uber Eats')
      transaction = Transaction.new(description: 'some text including uber eats')
      merchant = transaction.prepare_merchant
      expect(merchant).to eq expected
    end

    it 'returns new Merchant called unknown if no merchants matching description text' do
      transaction = Transaction.new(description: 'Uber')
      merchant = transaction.prepare_merchant
      expect(merchant.name).to eq 'unknown'
    end
  end
end
