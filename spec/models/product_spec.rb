require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to validate_presence_of(:name) }
  end
end