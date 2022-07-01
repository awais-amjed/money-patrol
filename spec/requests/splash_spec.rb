require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET #index' do
    before(:example) { get splash_index_path } # get(:index)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct title' do
      expect(response.body.include?('Money Patrol')).to be_truthy
    end
  end
end
