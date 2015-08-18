require "rails_helper"

RSpec.describe FactoidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/factoids").to route_to("factoids#index")
    end

    it "routes to #new" do
      expect(:get => "/factoids/new").to route_to("factoids#new")
    end

    it "routes to #show" do
      expect(:get => "/factoids/1").to route_to("factoids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/factoids/1/edit").to route_to("factoids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/factoids").to route_to("factoids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/factoids/1").to route_to("factoids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/factoids/1").to route_to("factoids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/factoids/1").to route_to("factoids#destroy", :id => "1")
    end

  end
end
