# encoding: utf-8

require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  describe "instance method" do
    subject { Factory(:user) }
  
    describe "#email" do
      it 'strips whitespace' do
        subject.email = 'test@example.org '
        subject.email.should == 'test@example.org'
      end

      it 'sets errors on invalid formatting' do
        subject.email = 'invalid||||||example.com'
        subject.should have_at_least(1).errors_on(:email)
      end
    end
    
    describe "#first_name" do
      it 'strips whitespace' do
        subject.first_name = 'test '
        subject.first_name.should == 'test'
      end
    end
    
    describe "#last_name" do
      it 'strips whitespace' do
        subject.last_name = 'test '
        subject.last_name.should == 'test'
      end
    end
  end
  
end
