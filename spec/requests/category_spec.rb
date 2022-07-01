require 'rails_helper'

RSpec.describe 'Category', type: :request do
  before do
    @user = User.create!(name: 'meow', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in @user
    @category = Category.create!(author: @user, name: 'Test Category', icon: 'Test Icon')
  end

  describe 'GET #index' do
    before(:example) { get categories_path } # get(:index)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct title' do
      expect(response.body.include?('Categories')).to be_truthy
    end
  end

  describe 'GET #show' do
    before(:example) { get category_path(@category) } # get(:show)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body.include?('Expenses')).to be_truthy
    end
  end
end
