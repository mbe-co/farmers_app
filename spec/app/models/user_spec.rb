require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_db_index(:email) }
    it do
      is_expected.to define_enum_for(:role)
        .with_values([:operator, :admin])
    end
  end
end
