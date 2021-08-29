require 'rails_helper'

RSpec.describe "Inqueries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/inquery/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/inquery/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thanks" do
    it "returns http success" do
      get "/inquery/thanks"
      expect(response).to have_http_status(:success)
    end
  end

end
