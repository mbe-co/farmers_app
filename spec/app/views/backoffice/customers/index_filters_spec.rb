require 'rails_helper'

feature 'Customers filtering on backoffice index' do
  let(:admin) { create(:user, role: :admin) }

  context 'when admin' do
    include_context 'when admin authenticated'

    let!(:ativo) do
      create(:customer,
             name: 'Ana',
             email: 'active@mail.com')
    end

    let!(:inativo) do
      create(:customer,
             name: 'Mariana',
             status: :blocked,
             email: 'blocked@mail.com')
    end

    let!(:bloqueado) do
      create(:customer,
             name: 'Jessie',
             status: :inactive,
             email: 'inactive@mail.com')
    end

    context 'searching' do
      it 'successfully by name' do
        visit backoffice_customers_path

        fill_in 'q_name_or_email_cont', with: 'Ana'
        click_on 'Buscar'

        expect(page).to have_content('Ana')
        expect(page).to have_content('Mariana')
        expect(page).not_to have_content('Blocked')
      end

      it 'successfully by email' do
        visit backoffice_customers_path

        fill_in 'q_name_or_email_cont', with: 'blocked'
        click_on 'Buscar'

        expect(page).to have_content('Mariana')
        expect(page).not_to have_content('Ana')
        expect(page).not_to have_content('Jessie')
      end
    end
  end
end
