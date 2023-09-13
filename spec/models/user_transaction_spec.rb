require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  let(:user) { User.new(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com') }
  let(:category) do
    Category.create(
      name: 'home',
      icon: 'https://picsum.photos/300/300',
      user_id: user
    )
  end
  let(:user_transaction) do
    UserTransaction.create(
      name: 'Water',
      amount: 500,
      author_id: user,
      category_id: category
    )
  end

  describe 'attributes' do
    it 'Should have a name' do
      expect(user_transaction.name).to eq('Water')
    end

    it 'Should have an amount of 500' do
      expect(user_transaction.amount).to eq(500)
    end

    it 'Should have mohamed as user' do
      expect(user_transaction.author_id).to eq(user.id)
    end

    it 'Should have home as category' do
      expect(user_transaction.category_id).to eq(category.id)
    end
  end
end
