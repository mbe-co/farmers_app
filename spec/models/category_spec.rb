require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it { is_expected.to have_many(:products) }
  end
end
