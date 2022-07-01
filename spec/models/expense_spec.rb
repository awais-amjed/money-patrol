require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    @user = User.create!(name: 'Test User', email: 'a@b.c', password: '123123')
    @category = Category.create!(author_id: @user.id, name: 'Test Category', icon: 'Test Icon')
  end

  subject { @expense = Expense.new(category: @category, name: 'Test Expense', amount: 20.0) }

  context 'After creating a new expense object' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have some amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end

  before { subject.save }

  context 'After saving expense object to database' do
    it 'should exist an expense with this name in database' do
      expect(Expense.find_by_name(@expense.name)).to_not be_nil
    end
  end
end
