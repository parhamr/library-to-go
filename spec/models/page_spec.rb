# encoding: utf-8

require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }

  subject { create(:page) }

  describe "state machine" do
    it "should default to 'new'" do
      subject.state.should == 'new'
      subject.state_name.should == :new
    end

  end

  describe "instance method" do
    describe "#visible_at" do
      it "is invalid when after hidden_at" do
        subject.visible_at = Time.now
        subject.hidden_at = Time.now - 1.day
        subject.should have_at_least(1).error_on(:visible_at)
      end
    end
    describe "#hidden_at" do
      it "is invalid when before visible_at" do
        subject.hidden_at = Time.now
        subject.visible_at = Time.now + 1.day
        subject.should have_at_least(1).error_on(:hidden_at)
      end
    end
  end

end
