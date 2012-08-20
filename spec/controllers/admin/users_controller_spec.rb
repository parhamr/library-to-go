# encoding: utf-8

require 'spec_helper'

describe Admin::UsersController do

  context "as admin" do
    let(:user) { create(:admin) }

  	before(:each) do
      sign_in user
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => user
      response.should render_template(:show)
    end
  end

end
