require 'rails_helper'

feature 'Home page' do
  context 'when not authenticated' do
    it 'views a welcome message' do
      visit root_path

      expect(page).to have_content('Boas Vindas!')
    end

    it 'views employees login button' do
      visit root_path

      expect(page).to have_link('funcionário? faça login')
    end

    it 'views navbar options for unlogged' do
      visit root_path

      expect(page).to have_content('sobre')
      expect(page).to have_content('escolher produtos')
      expect(page).to have_content('entrar')
    end
  end

  context 'when authenticated' do
    context 'when customer' do
      let(:customer) { create(:customer) }

      it 'views customer navbar options' do
        login_as customer

        visit root_path

        expect(page).to have_content('sobre')
        expect(page).to have_content('escolher produtos')
        expect(page).to have_content('sacola de compras')
        expect(page).to have_content('meu perfil')
        expect(page).to have_content('sair')
      end
    end
  end
end
