# frozen_string_literal: true

require 'rails_helper'

describe MainController, type: :routing do
  describe 'routing' do
    it 'routes to #root (#)' do; expect(get('/')).to route_to('main#index'); end
  end
end
