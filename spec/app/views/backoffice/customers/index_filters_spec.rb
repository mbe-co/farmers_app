require 'rails_helper'

feature 'Customers filtering on backoffice index' do
  let(:admin) { create(:user, role: :admin) }

  context 'when admin' do
    include_context 'when admin authenticated'

    let!(:ativo)      { create(:customer, name: 'Active') }
    let!(:inativo)    { create(:customer, name: 'Blocked', status: :blocked) }
    let!(:bloqueado)  { create(:customer, name: 'Inactive', status: :inactive) }

    it 'views only active customers when no filter was passed' do
      visit backoffice_customers_path

      expect(page).to have_content('Active')
      expect(page).not_to have_content('Inactive')
      expect(page).not_to have_content('Blocked')
    end

    it 'views inactive customers when filtering inactive' do
      visit backoffice_customers_path
      choose 'inactive'
      click_on 'Buscar'

      expect(page).to have_content('Inactive')
      expect(page).not_to have_content('Active')
      expect(page).not_to have_content('Blocked')
    end

    it 'views blocked customers when filtering blocked' do
      visit backoffice_customers_path
      choose 'blocked'
      click_on 'Buscar'

      expect(page).to have_content('Blocked')
      expect(page).not_to have_content('Active')
      expect(page).not_to have_content('Inactive')
    end
  end
end
