require 'rails_helper'

feature 'Customer update address' do
  let(:customer) { create(:customer) }
  let!(:address) { create(:address, street: 'tres', customer: customer) }

  context 'when authenticated' do
    it 'from root path' do
      login_as customer

      visit root_path
      click_on 'meu perfil'
      click_on 'Meu endereço'

      expect(page).to have_selector("input[name='address[zipcode]']")
      expect(page).to have_selector("input[name='address[street]']")
      expect(page).to have_button('Alterar')
    end

    it 'update when exists' do
      login_as customer

      visit profile_address_path
      fill_in 'rua', with: 'dois'
      click_on 'Alterar'

      expect(page).to have_content('Alterado com sucesso')
      expect(address.reload.street).to eq('dois')
    end

    it 'creates when does not exist' do
      other_customer = create(:customer)

      login_as other_customer

      visit profile_address_path

      fill_in 'rua', with: 'seis'
      fill_in 'número', with: '234'
      fill_in 'bairro', with: 'noronha'
      fill_in 'cidade', with: 'Sao Paulo'
      fill_in 'estado', with: 'SP'
      fill_in 'CEP', with: '05638900'
      click_on 'Alterar'

      other_customer.reload

      expect(page).to have_content('Alterado com sucesso')
      expect(other_customer.address).not_to be_nil
      expect(other_customer.address).to have_attributes(street: 'seis')
      expect(other_customer.address).to have_attributes(number: '234')
      expect(other_customer.address).to have_attributes(neighborhood: 'noronha')
      expect(other_customer.address).to have_attributes(city: 'Sao Paulo')
      expect(other_customer.address).to have_attributes(state: 'SP')
    end

    context 'validations' do
      it 'can not be blank' do
        login_as customer

        visit profile_address_path
        fill_in 'CEP', with: ''
        fill_in 'rua', with: ''
        fill_in 'número', with: ''
        fill_in 'bairro', with: ''
        fill_in 'cidade', with: ''
        fill_in 'estado', with: ''
        click_on 'Alterar'

        expect(page).to have_content('não pode ficar em branco', count: 6)
        expect(address.zipcode).not_to be_blank
        expect(address.street).not_to be_blank
        expect(address.number).not_to be_blank
      end
    end
  end
end
