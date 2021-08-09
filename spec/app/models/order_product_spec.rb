require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
