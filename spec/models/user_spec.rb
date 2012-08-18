# encoding: utf-8

require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should have_and_belong_to_many(:roles) }

  describe "instance method" do
    subject { create(:user) }
    let(:admin) { create(:admin) }
  
    describe "#email" do
      it 'sets errors on invalid formatting' do
        subject.email = 'invalid||||||example.com'
        subject.should have_at_least(1).errors_on(:email)
      end
    end

    describe "#email=" do
      it 'strips whitespace' do
        subject.email = 'test@example.org '
        subject.email.should == 'test@example.org'
      end

      it 'does not raise NilClass errors' do
        lambda {
          subject.email = nil
          subject.email.should == nil
        }.should_not raise_error
      end
    end
    
    describe "#first_name=" do
      it 'strips whitespace' do
        subject.first_name = 'test '
        subject.first_name.should == 'test'
      end
      
      it 'does not raise NilClass errors' do
        lambda {
          subject.first_name = nil
          subject.first_name.should == nil
        }.should_not raise_error
      end
    end
    
    describe "#last_name=" do
      it 'strips whitespace' do
        subject.last_name = 'test '
        subject.last_name.should == 'test'
      end

      it 'does not raise NilClass errors' do
        lambda {
          subject.last_name = nil
          subject.last_name.should == nil
        }.should_not raise_error
      end
    end

    describe "#role?" do
      it "detects admins" do
        admin.role?('admin').should be_true
      end
    end

  end

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }

    context "as admin" do
      let(:user) { create(:admin) }

      it{ should be_able_to(:manage, User) }

      it{ should be_able_to(:read, Role) }
      it{ should be_able_to(:create, Role) }
      it{ should be_able_to(:update, Role) }
      it{ should_not be_able_to(:destroy, Role) }
    end

    context "as member" do
      let(:user) { create(:member) }

      it{ should be_able_to(:read, User) }
      it{ should be_able_to(:update, user) }
      it{ should_not be_able_to(:update, User.new) }
      it{ should_not be_able_to(:create, User) }
      it{ should_not be_able_to(:destroy, User.new) }

      it{ should be_able_to(:read, Role) }
      it{ should_not be_able_to(:create, Role) }
      it{ should_not be_able_to(:update, Role) }
      it{ should_not be_able_to(:destroy, Role) }
    end
  end

  describe "taggings" do
    subject { create(:user) }

    context "for languages" do
      let(:languages) { 'english, klingon' }
      it "are empty by default" do
        subject.language_list.should == []
      end

      it "allows users to identify relevant languages" do
        subject.language_list = languages
        subject.language_list.should == ['english','klingon']
      end

      it "enables lookups on relevant languages" do
        subject.update_attributes({:language_list => languages}, :without_protection => true)
        User.tagged_with('klingon', :on => :languages).should == [subject]
      end

    end
  end
  
end
