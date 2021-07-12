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

      fill_in I18n.t('activerecord.attributes.product.name'), with: 'fuit name'
      click_on I18n.t('btn.create')

      expect(current_path).to match(backoffice_products_path)
      expect(page).to have_content(I18n.t('messages.success_on_create'))
      expect(page).to have_content('fuit name')
    end

    it 'views a back button that returns to products index' do
      visit new_backoffice_product_path

      expect(page).to have_link(I18n.t('btn.back'))
    end

    it 'downcase name of products' do
      create(:category)

      visit new_backoffice_product_path

      fill_in I18n.t('activerecord.attributes.product.name'), with: 'Banana'
      click_on I18n.t('btn.create')

      expect(Product.last.name).to eq('banana')
    end
  end

  context 'validations' do
    include_context 'when admin authenticated'

    it 'can not be blank' do
      create(:category)

      visit new_backoffice_product_path

      click_on I18n.t('btn.create')

      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end

    it 'name is unique' do
      create(:product, name: 'banana')

      visit new_backoffice_product_path

      fill_in I18n.t('activerecord.attributes.product.name'), with: 'banana'
      click_on I18n.t('btn.create')

      expect(page).to have_content(I18n.t('errors.messages.taken'))
    end

    it 'have to register a category if there are none' do
      visit new_backoffice_product_path

      expect(page).to have_link(I18n.t('messages.category_necessary'))
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit new_backoffice_product_path

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit new_backoffice_product_path

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end
end