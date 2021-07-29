require 'rails_helper'

feature 'Customer views/edit profile' do
  let!(:customer) { create(:customer, name: 'Joana') }

  context 'when authenticated' do
    it 'from home page' do
      login_as customer

      visit root_path
      click_on 'meu perfil'

      expect(page).to have_link('Adicionar avatar')
      expect(page).to have_selector("input[value='#{customer.email}']")
    end

    it 'views my profile options' do
      login_as customer

      visit profile_path

      expect(page).to have_link('Meus dados', href: profile_path)
      expect(page).to have_link('Meu endereço', href: profile_address_path)
    end

    it 'update name' do
      login_as customer

      visit profile_path

      fill_in 'nome', with: 'Joana Darc'
      click_on 'Alterar'

      expect(page).to have_content('Alterado com sucesso')
      expect(page).to have_selector("input[value='Joana Darc']")
    end
  end

  context 'when not authenticated' do
    it 'is redirected to login page' do
      visit profile_path

      expect(page).to have_content('Para continuar, efetue login ou registre-se')
    end
  end
end
