require 'rails_helper'

feature 'Products edition' do
  let(:admin)    { create(:user, name: 'Admin', role: :admin) }
  let(:employee) { create(:user, role: :operator) }
  let(:customer) { create(:customer, name: 'Customer') }
  let(:category) { create(:category, name: 'fruta') }
  let(:product)  { create(:product, name: 'banana', category: category) }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'successfully' do
      create(:category, name: 'hortaliça')
      visit edit_backoffice_product_path(product)

      select 'hortaliça'
      fill_in 'nome', with: 'alface'
      click_on 'Atualizar Produto'

      expect(current_path).to eq(backoffice_products_path)
      expect(page).to have_content('Alterado com sucesso')
      expect(page).to have_content('alface')
      expect(page).to have_content('hortaliça')
    end

    it 'views a back button that returns to products index' do
      visit edit_backoffice_product_path(product)

      expect(page).to have_link('Voltar')
    end

    context 'validations' do
      it 'name can not be blank' do
        visit edit_backoffice_product_path(product)

        fill_in 'nome', with: ''
        click_on 'Atualizar Produto'

        expect(page).to have_content('não pode ficar em branco')
      end

      it 'name must be unique' do
        create(:category, name: 'hortaliça')
        create(:product, name: 'alface')

        visit edit_backoffice_product_path(product)

        select 'hortaliça'
        fill_in 'nome', with: 'alface'
        click_on 'Atualizar Produto'

        expect(page).to have_content('já está em uso')
      end

      it 'sanitize name' do
        visit edit_backoffice_product_path(product)

        fill_in 'nome', with: 'ALFACE'
        click_on 'Atualizar Produto'

        expect(page).to have_content('alface')
      end
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit edit_backoffice_product_path(product)

      expect(page).to have_content('Não autorizado')
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit edit_backoffice_product_path(product)

      expect(page).to have_content('Não autorizado')
    end
  end
end
