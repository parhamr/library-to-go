require 'spec_helper'

describe PagesController do
  let(:page) { create(:page_with_slug) }

  describe "GET show" do
    it "assigns the requested page as @page" do
      get :show, {:slug => page.slug}
      assigns(:page).should eq(page)
    end
  end

end
