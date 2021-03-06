# frozen_string_literal: true

require 'rails_helper'

# Home Page
feature 'Index page' do
  it 'visits the index page' do
    visit root_path
    expect(page).to have_content 'Amazing Transaction Viewer by Bean'
  end

  it 'has instructions' do
    visit root_path
    expect(page).to have_content "Enter a transaction description and click 'Submit'"
  end

  it 'has submission form' do
    visit root_path
    expect(page).to have_content 'Enter description:'
    expect(page).to have_button 'Submit'
  end

  describe 'Transactions' do
    it 'displays transaction header' do
      visit root_path
      expect(page).to have_content 'Transactions (reverse chronologically)'
    end

    it 'displays no transactions message' do
      visit root_path
      expect(page).to have_content 'No transactions.'
    end

    it 'displays transaction descriptions' do
      merch = Merchant.create(name: 'Uber')
      Transaction.create(description: 'my new transaction', merchant_id: merch.id)
      visit root_path
      expect(page).to have_content 'my new transaction'
      expect(page).not_to have_content 'No transactions'
      Transaction.destroy_all
      Merchant.destroy_all
    end

    it 'displays multiple transaction descriptions' do
      merch = Merchant.create(name: 'Uber')
      merch2 = Merchant.create(name: 'Amazon')
      Transaction.create(description: 'my new transaction', merchant_id: merch.id)
      Transaction.create(description: 'my new transaction2', merchant_id: merch2.id)
      Transaction.create(description: 'my new transaction3', merchant_id: merch.id)
      visit root_path
      expect(page).to have_content "Merchant: Uber (id: #{merch.id}) - my new transaction"
      expect(page).to have_content "Merchant: Amazon (id: #{merch2.id}) - my new transaction2"
      expect(page).to have_content "Merchant: Uber (id: #{merch.id}) - my new transaction3"
      expect(page).not_to have_content 'No transactions'
      Transaction.destroy_all
      Merchant.destroy_all
    end
  end
end
