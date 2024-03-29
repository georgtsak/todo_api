require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        post :create, params: { signup: { email: 'working@example.com', password: 'password', password_confirmation: 'password' } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        post :create, params: { signup: { email: 'working@example.com', password: '', password_confirmation: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
