# encoding: utf-8

require 'requests/request_helper'

describe "Admin/Pages" do

  context "as admin" do

    before(:each) do
      @user ||= create(:admin)
      sign_in_as @user
    end

    describe "GET /admin/pages" do
      it "works! (now write some real specs)" do
        visit admin_pages_path
        page.status_code.should be(200)
      end
    end
    
  end

end
