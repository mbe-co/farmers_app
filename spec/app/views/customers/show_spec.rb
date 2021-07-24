require 'rails_helper'

feature 'Customer views profile' do
  let(:customer) { create(:customer) }

  context 'when authenticated' do
    it 'from home page' do
      login_as customer

      visit root_path
      click_on 'meu perfil'

      expect(page).to have_content("Boas vindas #{customer.name}")
    end

    it 'views my profile options' do
      login_as customer

      visit profile_path

      expect(page).to have_content('Adicionar endereço')
      expect(page).to have_content('Adicionar avatar')
      expect(page).to have_content('Alterar nome')
      expect(page).to have_content('Alterar senha')
    end
  end

  context 'when not authenticated' do
    it 'is redirected to login page' do
      visit profile_path

      expect(page).to have_content('Para continuar, efetue login ou registre-se')
    end
  end
end