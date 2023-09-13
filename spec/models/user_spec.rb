require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'mohamed', email: 'gigiyoyo2001@yahoo.com') }

  it 'the User has the correct name' do
    expect(user.name).to eq('mohamed')
  end
  it 'returns User has the correct email' do
    expect(user.email).to eq('gigiyoyo2001@yahoo.com')
  end
end