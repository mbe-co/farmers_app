require 'rails_helper'

feature 'products register' do
  let!(:admin) { create(:user, name: 'Admin', role: :admin) }
  let!(:employee) { create(:user, role: :operator) }
  let!(:customer) { create(:customer, name: 'Customer') }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'successfully' do
      create(:category)

      visit new_backoffice_product_path

      fill_in 'nome', with: 'fuit name'
      click_on 'Criar Produto'

      expect(current_path).to match(backoffice_products_path)
      expect(page).to have_content('Criado com sucesso')
      expect(page).to have_content('fuit name')
    end

    it 'views a back button that returns to products index' do
      visit new_backoffice_product_path

      expect(page).to have_link('Voltar')
    end

    it 'downcase name of products' do
      create(:category)

      visit new_backoffice_product_path

      fill_in 'nome', with: 'Banana'
      click_on 'Criar Produto'

      expect(Product.last.name).to eq('banana')
    end
  end

  context 'validations' do
    include_context 'when admin authenticated'

    it 'can not be blank' do
      create(:category)

      visit new_backoffice_product_path

      click_on 'Criar Produto'

      expect(page).to have_content('não pode ficar em branco')
    end

    it 'name is unique' do
      create(:product, name: 'banana')

      visit new_backoffice_product_path

      fill_in 'nome', with: 'banana'
      click_on 'Criar Produto'

      expect(page).to have_content('já está em uso')
    end

    it 'have to register a category if there are none' do
      visit new_backoffice_product_path

      expect(page).to have_link('Primeiro, cadastre uma categoria')
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit new_backoffice_product_path

      expect(page).to have_content('Não autorizado')
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit new_backoffice_product_path

      expect(page).to have_content('Não autorizado')
    end
  end
end
