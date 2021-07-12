require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { create(:category) }
  subject { build(:product, category: category) }

  context 'validations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to have_db_index(:name) }
    it do
      is_expected.to define_enum_for(:status)
        .with_values([:active, :inactive])
    end
  end

  it '#sanitize_name' do
    product = build(:product, name: 'Banana')

    product.sanitize_name

    expect(product.name).to eq('banana')
  end
end
