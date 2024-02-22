require 'rails_helper'

RSpec.describe "Auth API", type: :request do
  describe "POST /auth/login" do
    it "returns http success when valid credentials are provided" do
      User.create!(email: "test@example.com", password: "password", password_confirmation: "password")

      post "/auth/login", params: { email: "test@example.com", password: "password" }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to eq("Successful login")
    end

    it "returns http unauthorized when invalid credentials are provided" do
      post "/auth/login", params: { email: "invalid@example.com", password: "invalid_password" }

      expect(response).to have_http_status(:unauthorized)
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to eq("Invalid email or password")
    end
  end

  describe "GET /auth/logout" do
    it "returns http success and logs out the user" do
      get "/auth/logout"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response["message"]).to eq("Logout successful")
    end
  end
end
