require "spec_helper"

describe PagesController do
  describe "routing" do

    it "does not route to #new" do
      get("/pages/new").should_not be_routable
    end

    it "routes to #show" do
      get("/slug").should route_to("pages#show", :slug => "slug")
    end

    it "does not route to #edit" do
      get("/pages/1/edit").should_not be_routable
    end

    it "does not route to #create" do
      post("/pages").should_not be_routable
    end

    it "does not route to #update" do
      put("/pages/1").should_not be_routable
    end

    it "does not route to #destroy" do
      delete("/pages/1").should_not be_routable
    end

  end
end
