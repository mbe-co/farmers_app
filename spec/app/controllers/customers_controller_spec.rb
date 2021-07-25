require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  let(:customer) { create(:customer) }

  describe '#show' do
    context 'authenticated' do
      it 'successfully' do
        sign_in customer

        get profile_path

        expect(response).to be_successful
        expect(response.body).to include(customer.name)
      end
    end

    context 'not authenticated' do
      it 'is redirected to new session' do
        get profile_path

        expect(subject).to redirect_to(new_customer_session_url)
      end
    end
  end
end
