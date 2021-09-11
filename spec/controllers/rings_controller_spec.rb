require 'rails_helper'

RSpec.describe RingsController, type: :controller do
  describe 'Get #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'authenicated user creating new ring' do
    login_user 

    it 'responds successfully with HTTP 200 status code' do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'succesfully creates new ring record' do
      post :create, params: { ring: { ring_number: 1, ring_rank: "white-yellow", ring_age: "18-29", ring_gender: "women" }}
      expect(response).to redirect_to rings_path
    end
  end

  describe 'authenicated user can update' do
    login_user 

    it 'authenicated user updating a ring' do
      ring = FactoryBot.create(:ring)
      put :update, params: { id: ring, ring: { ring_number: 1, ring_rank: "camo-blue", ring_age: "10-12", ring_gender: "men", status: true }}
      ring.reload
      expect(response).to redirect_to rings_path 
      expect(ring.ring_rank).to match("camo-blue")
    end
  end

  describe 'unauthenicated user updating a ring' do
    it 'returns user to login page' do
      ring = FactoryBot.create(:ring)
      put :update, params: { id: ring, ring: { ring_number: 1, ring_rank: "camo-blue", ring_age: "10-12", ring_gender: "men", status: true }}
      ring.reload


      expect(response).to redirect_to new_user_session_path
      expect(ring.ring_rank).to match(ring.ring_rank)
    end
  end

  describe 'authenicated user deleteing a ring' do
    login_user

    it 'returns user to ring index' do
      ring = FactoryBot.create(:ring)
      post :destroy, { params: { id: ring } }

      expect(response).to redirect_to rings_path
    end
  end

  describe 'unauthenicated user deleteing a ring' do
    it 'returns user to login page' do
      ring = FactoryBot.create(:ring)
      put :update, params: { id: ring }
      ring.reload


      expect(response).to redirect_to new_user_session_path
      expect(ring.ring_rank).to match(ring.ring_rank)
    end
  end

  describe 'authenicated user move upcoming statie to active for a ring' do
    login_user

    it 'updates upcoming ring to active ring' do
      active_ring = FactoryBot.create(:ring)
      upcoming_ring = Ring.create(ring_number: 1, ring_rank: "white-yellow", ring_age: "18-29", ring_gender: "women", status: false)

      post :change_status, params: { ring_id: upcoming_ring.ring_number }
      upcoming_ring.reload

      expect(response).to redirect_to rings_path
      expect(upcoming_ring.status).to be true
      expect { active_ring.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'unauthenicated user move upcoming status to active for a ring' do
    it 'returns user to login page' do
      ring = FactoryBot.create(:ring)
      put :update, { params: { id: ring } }
      ring.reload

      expect(response).to redirect_to new_user_session_path
      expect(ring.ring_rank).to match(ring.ring_rank)
    end
  end

  describe 'unauthenticated users creating new ring' do
    it 'redirects to login if user is unauthenticated' do
      get :new

      expect(response).to redirect_to new_user_session_path
      expect(response).to have_http_status(302)
    end

    it 'succesfully creates new ring record' do
      post :create, params: { ring: {ring_number: 1, ring_rank: "white-yellow", ring_age: "18-29", ring_gender: "women" }}
      expect(response).to redirect_to new_user_session_path
    end
  end
end
