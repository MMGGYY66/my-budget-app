require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com', password: '123456') }
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

    it 'Should index template' do
      get '/categories'
      expect(response).to render_template(:index)
    end

    it 'Should successfully respond' do
      get '/categories'
      expect(response).to be_successful
    end

    it 'Test if categories is loading correctly the body and have as title Categories' do
      get '/categories'
      expect(response.body).to include('CATEGORIES')
    end

    it 'Test if categories is loading correctly the body and have the Add New category button' do
      get '/categories'
      expect(response.body).to include('Add new Category')
    end

    it 'Test if categories is loading correctly the body' do
      get '/categories'
      expect(response.body).to include('home')
      expect(response.body).to include('$500.0')
    end
  end

  describe 'GET/new' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com', password: '123456') }
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'Should index template' do
      get '/categories/new'
      expect(response).to render_template(:new)
    end
  end
end
