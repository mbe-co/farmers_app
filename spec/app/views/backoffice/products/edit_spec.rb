require 'rails_helper'

feature 'Products edition' do
  let(:admin)    { create(:user, name: 'Admin', role: :admin) }
  let(:employee) { create(:user, role: :operator) }
  let(:customer) { create(:customer, name: 'Customer') }
  let(:category)  { create(:category, name: 'fruta') }
  let(:product)   { create(:product, name: 'banana', category: category) }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'successfully' do
      create(:category, name: 'hortaliça')
      visit edit_backoffice_product_path(product)

      select 'hortaliça'
      fill_in I18n.t('activerecord.attributes.product.name'), with: 'alface'
      click_on I18n.t('helpers.submit.update', model: Product.model_name.human)

      expect(current_path).to eq(backoffice_products_path)
      expect(page).to have_content(I18n.t('messages.success_on_edit'))
      expect(page).to have_content('alface')
      expect(page).to have_content('hortaliça')
    end

    it 'views a back button that returns to products index' do
      visit edit_backoffice_product_path(product)

      expect(page).to have_link(I18n.t('btn.back'))
    end

    context 'validations' do
      it 'name can not be blank' do
        visit edit_backoffice_product_path(product)

        fill_in I18n.t('activerecord.attributes.product.name'), with: ''
        click_on I18n.t('helpers.submit.update', model: Product.model_name.human)

        expect(page).to have_content(I18n.t('errors.messages.blank'))
      end

      it 'name must be unique' do
        create(:category, name: 'hortaliça')
        other_product = create(:product, name: 'alface')

        visit edit_backoffice_product_path(product)

        select 'hortaliça'
        fill_in I18n.t('activerecord.attributes.product.name'), with: 'alface'
        click_on I18n.t('helpers.submit.update', model: Product.model_name.human)

        expect(page).to have_content(I18n.t('errors.messages.taken'))
      end
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit edit_backoffice_product_path(product)

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit edit_backoffice_product_path(product)

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end
end