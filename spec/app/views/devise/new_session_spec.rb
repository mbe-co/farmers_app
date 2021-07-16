require 'rails_helper'

feature 'Login' do
  context 'when customer' do
    let(:customer) { create(:customer) }

    it 'successfully and views customers navbar' do
      visit new_customer_session_path

      fill_in 'email', with: customer.email
      fill_in 'senha', with: customer.password
      click_on 'Log in'

      expect(page).to have_content('Login efetuado com sucesso')
      expect(page).to have_content('sobre')
      expect(page).to have_content('sacola de compras')
      expect(page).to have_content('escolher produtos')
      expect(page).to have_content('meu perfil')
      expect(page).to have_link('sair')
    end

    it 'can not login on employees login' do
      visit new_user_session_path

      fill_in 'email', with: customer.email
      fill_in 'senha', with: customer.password
      click_on 'Log in'

      expect(page).to have_content('email ou senha inválida')
    end
  end

  context 'when admin' do
    let(:admin) { create(:user, role: :admin) }

    it 'successfully and views backoffice navbar' do
      visit new_user_session_path

      fill_in 'email', with: admin.email
      fill_in 'senha', with: admin.password
      click_on 'Log in'

      expect(page).to have_content('Login efetuado com sucesso')
      expect(page).to have_content('Produtos')
      expect(page).to have_content('Categorias')
      expect(page).to have_link('sair')
    end

    it 'does not view register link' do
      visit new_user_session_path

      expect(page).not_to have_link('Sign up')
    end

    it 'can not login on customers login' do
      visit new_customer_session_path

      fill_in 'email', with: admin.email
      fill_in 'senha', with: admin.password
      click_on 'Log in'

      expect(page).to have_content('email ou senha inválida')
    end
  end

  context 'when employee' do
    let(:employee) { create(:user) }

    it 'successfully' do
      visit new_user_session_path

      fill_in 'email', with: employee.email
      fill_in 'senha', with: employee.password
      click_on 'Log in'

      expect(page).to have_content('Login efetuado com sucesso')
    end

    it 'does not view register link' do
      visit new_user_session_path

      expect(page).not_to have_link('Sign up')
    end

    it 'can not login on customers login' do
      visit new_customer_session_path

      fill_in 'email', with: employee.email
      fill_in 'senha', with: employee.password
      click_on 'Log in'

      expect(page).to have_content('email ou senha inválida')
    end
  end
end