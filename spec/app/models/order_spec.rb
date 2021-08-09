require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to validate_presence_of(:purchase_date) }
    it { is_expected.to validate_presence_of(:due_date) }
  end
end
