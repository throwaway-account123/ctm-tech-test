# frozen_string_literal: true

require 'rails_helper'

describe MainController, type: :controller do
  describe '#index GET /' do
    it 'responds to request' do
      get :index
      expect(response.status).to be 200
    end
  end
end