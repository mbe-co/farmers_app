require 'rails_helper'

RSpec.describe Backoffice::CategoriesController, type: :request do
  describe 'index' do
    let(:admin) { create(:user, role: :admin) }
    context 'when there are categories registered' do 
      before { sign_in admin }
      let!(:categories) { create_list(:category, 3) }
      
      let(:result) { get backoffice_categories_path }
    end
  end
end