require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
