require 'rails_helper'

RSpec.describe "Factoids", type: :request do
  describe "GET /factoids" do
    it "works! (now write some real specs)" do
      get factoids_path
      expect(response).to have_http_status(200)
    end
  end
end
