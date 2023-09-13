require 'rails_helper'

describe 'Categories', type: :request do
  describe 'GET /index' do
    context 'when user is not signed in' do
      it 'redirects to the sign-in page' do
        get categories_path
        expect(response).to redirect_to(splash_screen_path)
      end
    end

    context 'when user is signed in' do
      let(:user) do
        User.create(
          name: 'mohamed',
          email: "#{Faker::Name.first_name}@test.com",
          password: '123456',
          password_confirmation: '123456'
        )
      end

      let(:category) { Category.create!(name: "home #{rand}", icon: 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg') }

      before(:each) do
        user.save
        category.save
        user_transaction.save
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end
    end
  end
end
