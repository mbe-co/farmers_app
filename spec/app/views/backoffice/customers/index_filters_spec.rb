require 'rails_helper'

feature 'Customers filtering on backoffice index' do
  let(:admin)    { create(:user, role: :admin) }
  let(:customer) { create(:customer, name: 'Emily', email: 'emily@mail.com') }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'views only active customers when no filter was passed' do
      create(:customer, name: 'Active')
      create(:customer, name: 'Blocked', status: :blocked)
      create(:customer, name: 'Inactive', status: :inactive)

      visit backoffice_customers_path

      expect(page).to have_content('Active')
      expect(page).not_to have_content('Inactive')
      expect(page).not_to have_content('Blocked')
    end

    it 'views inactive customers when filtering inactive' do
      create(:customer, name: 'Active')
      create(:customer, name: 'Blocked', status: :blocked)
      create(:customer, name: 'Inactive', status: :inactive)

      visit backoffice_customers_path
      choose 'inactive'
      click_on 'Buscar'

      expect(page).to have_content('Inactive')
      expect(page).not_to have_content('Active')
      expect(page).not_to have_content('Blocked')
    end

    it 'views blocked customers when filtering blocked' do
      create(:customer, name: 'Active')
      create(:customer, name: 'Blocked', status: :blocked)
      create(:customer, name: 'Inactive', status: :inactive)

      visit backoffice_customers_path
      choose 'blocked'
      click_on 'Buscar'

      expect(page).to have_content('Blocked')
      expect(page).not_to have_content('Active')
      expect(page).not_to have_content('Inactive')
    end
  end
end