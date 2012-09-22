# encoding: utf-8

require 'spec_helper'

describe Admin::PagesController do

  let(:page) { create(:page_with_slug) }
  let(:valid_attributes) { attributes_for(:page_with_slug) }
  let(:invalid_attributes) { attributes_for(:page) }

  context "as admin" do
    let(:user) { create(:admin) }

    before(:each) do
      sign_in user
    end

    after :each do
      sign_out user
    end

    describe "GET index" do
      it "assigns all pages as @pages" do
        page
        get :index
        assigns(:pages).should eq([page])
      end
    end

    describe "GET show" do
      it "assigns the requested page as @page" do
        get :show, {:id => page.to_param}
        assigns(:page).should eq(page)
      end
    end

    describe "GET new" do
      it "assigns a new page as @page" do
        get :new
        assigns(:page).should be_a_new(Page)
      end
    end

    describe "GET edit" do
      it "assigns the requested page as @page" do
        get :edit, {:id => page.to_param}
        assigns(:page).should eq(page)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Page" do
          expect {
            post :create, {:page => valid_attributes}
          }.to change(Page, :count).by(1)
        end

        it "assigns a newly created page as @page" do
          post :create, {:page => valid_attributes}
          assigns(:page).should be_a(Page)
          assigns(:page).should be_persisted
        end

        it "redirects to the created page" do
          post :create, {:page => valid_attributes}
          response.should redirect_to(admin_page_url(Page.last))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved page as @page" do
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          post :create, {:page => {}}
          assigns(:page).should be_a_new(Page)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          post :create, {:page => {}}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested page" do
          Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => page.to_param, :page => {'these' => 'params'}}
        end

        it "assigns the requested page as @page" do
          put :update, {:id => page.to_param, :page => valid_attributes}
          assigns(:page).should eq(page)
        end

        it "redirects to the page" do
          put :update, {:id => page.to_param, :page => valid_attributes}
          response.should redirect_to(admin_page_url(page))
        end
      end

      describe "with invalid params" do
        it "assigns the page as @page" do
          put :update, {:id => page.to_param, :page => {title: ''}}
          assigns(:page).should eq(page)
        end

        it "re-renders the 'edit' template" do
          put :update, {:id => page.to_param, :page => {title: ''}}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested page" do
        page
        expect {
          delete :destroy, {:id => page.to_param}
        }.to change(Page, :count).by(-1)
      end

      it "redirects to the pages list" do
        delete :destroy, {:id => page.to_param}
        response.should redirect_to(admin_pages_url)
      end
    end

  end

end
