require 'rails_helper'

describe Customer, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_one(:address) }
  end
end
