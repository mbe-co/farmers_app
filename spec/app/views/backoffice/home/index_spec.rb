require 'rails_helper'

feature 'Admin Welcome Page' do
  let(:admin)    { create(:user, name: 'Admin', role: :admin) }

  context 'when admin' do
    include_context 'when admin authenticated'

    it 'successfully' do
      visit backoffice_home_path

      expect(page).to have_content('Boas Vindas!')
    end
  end
end