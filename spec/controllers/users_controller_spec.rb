require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }
  let(:member) { create(:member) }
  let(:valid_attributes) { attributes_for(:user) }
  let(:accessible_attributes) { attributes_for(:member).delete_if { |k,v| valid_attributes.has_key?(k) } }

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user
      get :edit, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => user.to_param, :user => {'these' => 'params'}}
      end

      it "assigns the requested user as @user" do
        put :update, {:id => user.to_param, :user => accessible_attributes}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        put :update, {:id => user.to_param, :user => accessible_attributes}
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, {:id => user.to_param, :user => {email: ''}}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => user.to_param, :user => {first_name: ''}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      member
      expect {
        delete :destroy, {:id => member.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => member.to_param}
      response.should redirect_to(users_url)
    end
  end

end
