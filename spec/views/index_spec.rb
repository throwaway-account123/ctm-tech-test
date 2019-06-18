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
end
