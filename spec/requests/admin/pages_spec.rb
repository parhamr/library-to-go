# encoding: utf-8

require 'requests/request_helper'

describe "Admin/Pages" do

  context "as admin" do

    before(:each) do
      @user = @user ||= create(:admin)
      sign_in @user
    end

    describe "GET /admin/pages" do
      it "works! (now write some real specs)" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get admin_pages_path
        response.status.should be(200)
      end
    end
    
  end

end
