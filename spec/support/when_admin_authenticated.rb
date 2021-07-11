RSpec.shared_context 'when admin authenticated' do
  background do
    authenticate_admin
  end

  def authenticate_admin
    visit new_user_session_path

    fill_in I18n.t('activerecord.attributes.user.email'), with: admin.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: admin.password
    click_button 'Log in'
  end
end
