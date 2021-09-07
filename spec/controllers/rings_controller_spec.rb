require 'rails_helper'

RSpec.describe RingsController, type: :controller do
  describe 'Get #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'authenicated user #new' do
    login_user 

    it 'responds successfully with HTTP 200 status code' do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'succesfully creates new ring record' do
      post :create, params: { ring: {ring_number: 1, ring_rank: "white-yellow", ring_age: "18-29", ring_gender: "women" }}
      expect(response).to redirect_to rings_path
    end
  end

  describe 'Get as unauthenticated users' do
    it 'redirects to login if user is unauthenticated' do
      get :new

      expect(response).to redirect_to new_user_session_path
      expect(response).to have_http_status(302)
    end
  end
end
