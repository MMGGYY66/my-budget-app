require 'rails_helper'

RSpec.describe 'UserTransaction', type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create!(
        name: 'mohamed',
        email: 'gigiyoyo2001@yahoo.com',
        password: '123456',
        password_confirmation: '123456'
      )
    end

    let(:category) do
      Category.create(
        name: 'home',
        icon: 'https://picsum.photos/300/300',
        user_id: user
      )
    end

    before(:each) do
      user.save
      category.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'returns http success' do
      get new_category_path(category)
      expect(response).to have_http_status(:success)
    end
  end
end
