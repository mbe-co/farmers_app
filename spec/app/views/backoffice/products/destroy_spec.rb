require 'rails_helper'

feature 'Product deletion' do
  let(:admin)    { create(:user, name: 'Admin', role: :admin) }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'successfully' do
      create(:product)

      visit backoffice_products_path

      click_link 'X'

      expect(page).to have_content(I18n.t('messages.success_on_destroy'))
      expect(page).to have_content(I18n.t('messages.no_register'))
    end
  end
end
