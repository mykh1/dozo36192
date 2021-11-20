require 'rails_helper'

RSpec.describe "Admin::Restaurants", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/admin/restaurants/new"
      expect(response).to have_http_status(:success)
    end
  end

end
