# frozen_string_literal: true

require 'rails_helper'

# Home Page
feature 'Index page' do
  scenario 'visit the index page' do
    visit root_path
    expect(page).to have_content "Amazing Transaction Viewer by Bean"
  end
end
