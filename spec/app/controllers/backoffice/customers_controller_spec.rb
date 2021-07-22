require 'rails_helper'

RSpec.describe Backoffice::CustomersController, type: :request do
  let(:admin) { create(:user, role: :admin) }
  let!(:customers) { create_list(:customer, 3) }

  describe 'Customers listing' do
    it 'successfully when admin' do
      sign_in admin

      get backoffice_customers_path

      expect(response).to be_successful
      expect(response.body).to include(customers.first.name)
      expect(response.body).to include(customers.second.name)
    end

    it 'with query params' do
      first = customers.first

      sign_in admin

      get backoffice_customers_path, params: { "q"=> { "name_or_email_cont"=> first.name } }

      expect(response).to be_successful
      expect(response.body).to include(first.name)
      expect(response.body).not_to include(customers.second.name)
    end

    it 'not logged as admin' do
      get backoffice_customers_path

      expect(response).to be_successful
      expect(response.body).to include('Não autorizado')
    end
  end
end
