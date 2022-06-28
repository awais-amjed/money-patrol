require 'rails_helper'

RSpec.describe Category, type: :model do
  before { @user = User.create!(name: 'Test User') }

  subject { @category = Category.new(author_id: @user.id, name: 'Test Category', icon: 'Test Icon') }

  context 'After creating a new category object' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  before { subject.save }

  context 'After saving category object to database' do
    it 'should be a category with this name in database' do
      expect(Category.find_by_name(@category.name)).to_not be_nil
    end
  end
end
