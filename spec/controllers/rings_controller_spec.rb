require 'rails_helper'

RSpec.describe RingsController, type: :controller do
  describe 'Get #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "Get new ring" do
    it 'responds with template for new ring' do
      get :new
      expect(response).to render_template('new')
    end
  end

  # describe "get edit ring" do
  #   it "responds with remplate for edit ring" do
  #     get :edit
  #     expect(responds).to render_template('edit')
  #   end
  # end
end
