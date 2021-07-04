require 'rails_helper'

describe Customer, type: :model do
  context 'validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:phone).only_integer }
    it { is_expected.to have_one(:address) }
    it { is_expected.to have_db_index(:email) }
    it do
      is_expected.to define_enum_for(:status).
        with_values([:active, :inactive, :blocked])
    end
  end
end
