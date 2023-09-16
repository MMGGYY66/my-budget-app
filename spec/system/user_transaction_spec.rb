require 'rails_helper'

RSpec.describe 'UserTransaction', type: :system do
  describe 'GET /index' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo@yahoo.com', password: '123456') }
    let(:category) do
      Category.create!(
        name: 'House',
        icon: 'https://picsum.photos/300/300',
        user:
      )
    end
    let(:user_transaction) do
      UserTransaction.create!(
        name: 'Furniture',
        amount: 3200,
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

    it 'Test if transactions is loading correctly the body and have as title Transactions' do
      visit "/categories/#{category.id}/user_transactions"
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'Test if transactions is loading correctly the body and have the "Add new Transaction" button' do
      visit "/categories/#{category.id}/user_transactions"
      expect(page).to have_content('ADD NEW TRANSACTION')
    end

    it 'Redirects from transactions index to add a new transaction' do
      visit "/categories/#{category.id}/user_transactions/"
      find('.btn', text: 'ADD NEW TRANSACTION').click
      expect(page).to have_current_path("/categories/#{category.id}/user_transactions/new", ignore_query: true)
    end
  end
end
