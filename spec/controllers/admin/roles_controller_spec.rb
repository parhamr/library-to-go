require 'spec_helper'

describe Admin::RolesController do
  let(:admin_role) { Role.where(name: 'admin').first || create(:admin_role) }
  let(:member_role) { Role.where(name: 'member').first || create(:member_role) }

  context "as admin" do
    let(:user) { create(:admin) }

    before(:each) do
      sign_in user
    end

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        get :show, {:id => member_role.to_param}
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get :new
        response.should be_success
      end
    end

    describe "POST 'create'" do
      it "returns http success" do
        post :create
        response.should be_success
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        get :edit, {:id => member_role.to_param}
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "returns http success" do
        put :update, {:id => member_role.to_param}
        response.should be_redirect
      end
    end

    describe "GET 'destroy'" do
      it "returns http success" do
        delete :destroy, {:id => member_role.to_param}
        response.should be_redirect
      end
    end

  end

end
