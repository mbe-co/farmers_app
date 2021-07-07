require 'rails_helper'

feature 'Home page' do
  context 'when not authenticated' do
    it 'views a welcome message' do
      visit root_path

      expect(page).to have_content(I18n.t('.welcome'))
    end

    it 'views employees login button' do
      visit root_path

      expect(page).to have_link(I18n.t('btn.employees_login'))
    end
  end
end