require 'rails_helper'

feature 'Active customers list' do
  let(:admin) { create(:user, role: :admin) }
  let(:employee) { create(:user) }
  let(:customer) { create(:customer) }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'from root path' do
      visit backoffice_home_path

      expect(page).to have_link('Clientes')
    end

    it 'views a list of active customers' do
      customers = create_list(:customer, 3)

      visit backoffice_customers_path

      expect(page).to have_content(customers.first.name)
      expect(page).to have_content(customers.first.email)
      expect(page).to have_content(customers.second.name)
      expect(page).to have_content(customers.second.email)
      expect(page).to have_content(customers.third.name)
      expect(page).to have_content(customers.third.email)
    end

    it 'views a link to details' do
      customer = create(:customer)

      visit backoffice_customers_path

      expect(page).to have_link('ver detalhes', href: backoffice_customer_path(customer))
    end

    it 'views a search input field' do
      visit backoffice_customers_path

      expect(page).to have_field('q_name_or_email_cont')
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit backoffice_customers_path

      expect(page).to have_content('Não autorizado')
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit backoffice_customers_path

      expect(page).to have_content('Não autorizado')
    end
  end
end
