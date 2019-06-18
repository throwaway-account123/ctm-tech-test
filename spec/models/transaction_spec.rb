require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:merchant) }
  it { is_expected.to validate_presence_of(:description) }
end
