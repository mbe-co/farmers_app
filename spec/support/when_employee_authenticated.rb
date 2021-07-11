RSpec.shared_context 'when employee authenticated' do
  background do
    authenticate_employee
  end

  def authenticate_employee
    visit new_user_session_path

    fill_in I18n.t('activerecord.attributes.user.email'), with: employee.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: employee.password
    click_button 'Log in'
  end
end
