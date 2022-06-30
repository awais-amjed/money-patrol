require 'rails_helper'

RSpec.describe User, type: :model do
  subject { @user = User.new(name: 'Test User', email: 'a@b.c', password: '123123') }

  context 'After creating a new user object' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  before { subject.save }

  context 'After saving user object to database' do
    it 'should exist a user with this name in database' do
      expect(User.find_by_name(@user.name)).to_not be_nil
    end
  end
end
