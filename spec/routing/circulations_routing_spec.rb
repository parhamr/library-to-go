require "spec_helper"

describe CirculationsController do
  describe "routing" do

    it "routes to #index" do
      get("/circulations").should route_to("circulations#index")
    end

    it "routes to #new" do
      get("/circulations/new").should route_to("circulations#new")
    end

    it "routes to #show" do
      get("/circulations/1").should route_to("circulations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/circulations/1/edit").should route_to("circulations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/circulations").should route_to("circulations#create")
    end

    it "routes to #update" do
      put("/circulations/1").should route_to("circulations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/circulations/1").should route_to("circulations#destroy", :id => "1")
    end

  end
end
