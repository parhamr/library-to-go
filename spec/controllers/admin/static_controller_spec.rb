require 'spec_helper'

describe Admin::StaticController do

  context "as admin" do
    let(:user) { create(:admin) }

    before(:each) do
      sign_in user
    end

    after :each do
      sign_out user
    end

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

  end

end
