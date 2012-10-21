require "spec_helper"

describe AddressesController do
  describe "routing" do

    let(:member) { create(:member) }
    let(:member_uri) { "/users/#{member.id}" }

    context '(as a nested resource of users)' do

      it "routes to #index" do
        get("#{member_uri}/addresses").should route_to("addresses#index", :user_id => member.id.to_s)
      end

      it "routes to #new" do
        get("#{member_uri}/addresses/new").should route_to("addresses#new", :user_id => member.id.to_s)
      end

      it "routes to #show" do
        get("#{member_uri}/addresses/1").should route_to("addresses#show", :id => "1", :user_id => member.id.to_s)
      end

      it "routes to #edit" do
        get("#{member_uri}/addresses/1/edit").should route_to("addresses#edit", :id => "1", :user_id => member.id.to_s)
      end

      it "routes to #create" do
        post("#{member_uri}/addresses").should route_to("addresses#create", :user_id => member.id.to_s)
      end

      it "routes to #update" do
        put("#{member_uri}/addresses/1").should route_to("addresses#update", :id => "1", :user_id => member.id.to_s)
      end

      it "routes to #destroy" do
        delete("#{member_uri}/addresses/1").should route_to("addresses#destroy", :id => "1", :user_id => member.id.to_s)
      end

    end

  end
end
