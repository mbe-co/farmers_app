require 'rails_helper'

feature 'Customer update address' do
  let(:customer) { create(:customer) }
  let!(:address) { create(:address, street: 'tres',customer: customer) }

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

    it 'successfully' do
      login_as customer

      visit profile_address_path
      fill_in 'rua', with: 'dois'
      click_on 'Alterar'

      expect(page).to have_content('Alterado com sucesso')
      expect(page).to have_selector("input[value='dois']")
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
      end
    end
  end
end
