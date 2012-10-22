# encoding: utf-8

require "spec_helper"

describe CirculationsController do
  describe "routing" do

    let(:organization) { create(:organization, :with_locations) }
    let(:organization_uri) { "/organizations/#{organization.id}" }

    context '(as a nested resource of organizations)' do

      it "routes to #index" do
        get("#{organization_uri}/circulations").should route_to("circulations#index", organization_id: organization.id.to_s)
      end

      it "routes to #new" do
        get("#{organization_uri}/circulations/new").should route_to("circulations#new", organization_id: organization.id.to_s)
      end

      it "routes to #show" do
        get("#{organization_uri}/circulations/1").should route_to("circulations#show", :id => "1", organization_id: organization.id.to_s)
      end

      it "routes to #edit" do
        get("#{organization_uri}/circulations/1/edit").should route_to("circulations#edit", :id => "1", organization_id: organization.id.to_s)
      end

      it "routes to #create" do
        post("#{organization_uri}/circulations").should route_to("circulations#create", organization_id: organization.id.to_s)
      end

      it "routes to #update" do
        put("#{organization_uri}/circulations/1").should route_to("circulations#update", :id => "1", organization_id: organization.id.to_s)
      end

      it "routes to #destroy" do
        delete("#{organization_uri}/circulations/1").should route_to("circulations#destroy", :id => "1", organization_id: organization.id.to_s)
      end

    end

  end
end
