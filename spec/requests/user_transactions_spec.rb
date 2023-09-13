require 'rails_helper'

RSpec.describe 'UserTransaction', type: :request do
  describe 'GET /index' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com', password: '123456') }
    let(:category) do
      Category.create(
        name: 'home',
        icon: 'https://picsum.photos/300/300',
        user_id: user
      )
    end

    let(:user_transaction) do
      UserTransaction.create!(
        name: 'Water',
        amount: 500,
        author: user,
        category:
      )
    end

    before(:each) do
      user.save
      category.save
      user_transaction.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'Should render index template' do
      get "/categories/#{category.id}/user_transactions"
      expect(response).to render_template(:index)
    end

    it 'Should successfully respond' do
      get "/categories/#{category.id}/user_transactions"
      expect(response).to be_successful
    end

    it 'Test if transactions is loading correctly the body and have as title Categories' do
      get "/categories/#{category.id}/user_transactions"
      expect(response.body).to include('TRANSACTIONS')
    end

    it 'Test if transactions is loading correctly the body and have the Add New Transaction button' do
      get "/categories/#{category.id}/user_transactions"
      expect(response.body).to include('Add new Transaction')
    end

    it 'Test if transactions is loading correctly the body' do
      get "/categories/#{category.id}/user_transactions"
      expect(response.body).to include('home')
      expect(response.body).to include('Water')
      expect(response.body).to include('$500.0')
    end
  end

  describe 'GET/new' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com', password: '123456') }
    let(:category) do
      Category.create!(
        name: 'home',
        icon: 'https://picsum.photos/300/300',
        user:
      )
    end
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it 'Should index template' do
      get "/categories/#{category.id}/user_transactions/new"
      expect(response).to render_template(:new)
    end
  end
end
