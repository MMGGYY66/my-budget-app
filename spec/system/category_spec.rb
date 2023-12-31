require 'rails_helper'

RSpec.describe 'Category', type: :system do
  describe 'GET /index' do
    let(:user) { User.create!(name: 'mohamed', email: 'gigiyoyo@yahoo.com', password: '123456') }
    let(:category) do
      Category.create!(
        name: 'House',
        icon: 'https://picsum.photos/300/300',
        user:
      )
    end
    before(:each) do
      user.save
      category.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'Test if categories is loading correctly the body and have as title Categories' do
      visit '/categories'
      expect(page).to have_content('CATEGORIES')
    end

    it 'Test if Categories is loading correctly the body and have the "Add new Category" button' do
      visit '/categories'
      expect(page).to have_content('ADD NEW CATEGORY')
    end

    it 'Test if Categories is loading correctly the body and have the "Housing" category' do
      visit '/categories'
      expect(page).to have_content('House')
    end

    it 'Redirects from category index to add a new category' do
      visit '/categories/'
      find('.btn', text: 'ADD NEW CATEGORY').click
      expect(page).to have_current_path('/categories/new', ignore_query: true)
    end
  end
end
