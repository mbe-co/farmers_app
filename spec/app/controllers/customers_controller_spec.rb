require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  let(:customer) { create(:customer, name: 'Joana') }

  describe '#GET /profile' do
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

  describe '#PATCH /profile' do
    context 'authenticated' do
      it 'with valid params' do
        sign_in customer

        patch profile_path, params: { customer: { name: 'Joana Darc' } }

        expect(subject).to redirect_to(profile_path)
        expect(flash[:notice]).to match(/Alterado com sucesso/)
      end

      it 'with invalid params' do
        sign_in customer

        patch profile_path, params: { customer: { name: '' } }

        expect(response.body).to include('não pode ficar em branco')
      end
    end

    context 'not authenticated' do
      it 'is redirected to new session' do
        patch profile_path

        expect(subject).to redirect_to(new_customer_session_url)
      end
    end
  end
end
