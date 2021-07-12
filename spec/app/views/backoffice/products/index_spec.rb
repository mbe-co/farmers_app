require "rails_helper"

feature 'products listing' do
  let!(:admin)    { create(:user, name: 'Admin', role: :admin) }
  let!(:employee) { create(:user, role: :operator) }
  let!(:customer) { create(:customer, name: 'Customer') }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'views a link to register a new product' do
      visit backoffice_products_path

      expect(page).to have_link(I18n.t('btn.new'))
    end

    it 'views a message when no products registered' do
      visit backoffice_products_path

      expect(page).to have_content(I18n.t('messages.no_register'))
    end

    it 'views a table of products when products registered' do
      category = create(:category)
      products = create_list(:product, 3, category: category)

      visit backoffice_products_path

      expect(page).to have_content(products.first.name)
      expect(page).to have_content(products.first.category.name)
      expect(page).to have_content(products.second.name)
      expect(page).to have_content(products.second.category.name)
      expect(page).to have_content(products.third.name)
      expect(page).to have_content(products.third.category.name)
    end

    it 'views edit and delete buttons' do
      category = create(:category)
      product = create(:product, category: category)

      visit backoffice_products_path

      expect(page).to have_link(product.name,
        href: edit_backoffice_product_path(product))
      expect(page).to have_link('X')
    end
  end

  context 'when employee' do
    include_context 'when employee authenticated'

    it 'views not authorized message' do
      visit backoffice_products_path

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end

  context 'when customer' do
    it 'views not authorized message' do
      login_as customer
      visit backoffice_products_path

      expect(page).to have_content(I18n.t('messages.not_authorized'))
    end
  end
end