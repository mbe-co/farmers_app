require 'rails_helper'

RSpec.describe AddressController, type: :request do
  let(:customer) { create(:customer) }

  let(:params) do
    {
      address: {
        zipcode: '07896110',
        street: 'Alameda Santos',
        number: '78',
        complement: '',
        neighborhood: 'Bela Vista',
        city: 'São Paulo',
        state: 'São Paulo'
      }
    }
  end

  describe '# GET /profile/address' do
    it 'successfully' do
      sign_in customer

      get profile_address_path

      expect(response).to be_successful
      expect(response.body).to include('Meu endereço')
      expect(response.body).to include('rua')
      expect(response.body).to include('número')
      expect(response.body).to include('Alterar')
    end

    it 'not logged in' do
      get profile_address_path

      expect(subject).to redirect_to(new_customer_session_url)
    end
  end

  describe '# PATCH /profile/address' do
    it 'successfully' do
      sign_in customer

      patch profile_address_path, params: params

      expect(subject).to redirect_to(profile_address_path)
    end

    it 'without params' do
      sign_in customer

      patch profile_address_path

      expect(subject).to redirect_to(profile_address_path)
    end

    it 'not logged in' do
      get profile_address_path

      expect(subject).to redirect_to(new_customer_session_url)
    end
  end
end
