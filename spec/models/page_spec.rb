# encoding: utf-8

require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }

  subject { create(:page) }
  let(:page_with_slug) { create(:page_with_slug) }

  describe "state machine" do
    it "should default to 'new'" do
      subject.state.should == 'new'
      subject.state_name.should == :new
    end

  end

  describe "[instance]" do

    describe "#visible_at" do
      it "is invalid when after hidden_at" do
        subject.visible_at = Time.now
        subject.hidden_at = Time.now - 1.day
        subject.should have_at_least(1).error_on(:visible_at)
      end

      it "is valid without hidden_at" do
        subject.hidden_at = nil
        subject.visible_at = Time.now
        subject.should be_valid
      end
    end

    describe "#hidden_at" do
      it "is invalid when before visible_at" do
        subject.hidden_at = Time.now
        subject.visible_at = Time.now + 1.day
        subject.should have_at_least(1).error_on(:hidden_at)
      end

      it "is valid without visible_at" do
        subject.hidden_at = Time.now
        subject.visible_at = nil
        subject.should be_valid
      end
    end

    describe '#slug' do
      let(:bad_slug) { 'abc<>"|:&./?%*' }

      it 'removes reserved path characters' do
        subject.update_attributes({slug: bad_slug}, as: :root)
        subject.slug.should == 'abc'
      end

      it 'removes spaces' do
        page_with_slug.should be_valid
        page_with_slug.slug.should_not include(' ')
      end

    end

  end

  describe '[class]' do

    subject { Page }
    let(:page) { create(:page) }

    describe 'scopes' do

      describe '::visible_now' do

        let(:time_before) { Time.utc(2012,6,1,14,0,0) }
        let(:time_visible) { Time.utc(2012,6,5,14,0,0) }
        let(:time_within) { Time.utc(2012,6,9,14,0,0) }
        let(:time_hidden) { Time.utc(2012,6,13,14,0,0) }
        let(:time_after) { Time.utc(2012,6,17,14,0,0) }

        let(:page) { create(:approved_page, visible_at: nil, hidden_at: nil) }
        let(:page_with_timing) { create(:approved_page, visible_at: time_visible, hidden_at: time_hidden) }
        let(:page_with_hidden) { create(:approved_page, visible_at: nil, hidden_at: time_hidden) }
        let(:page_with_visible) { create(:approved_page, visible_at: time_visible, hidden_at: nil) }

        before do
          page.should be_valid
          page_with_timing.should be_valid
          page_with_hidden.should be_valid
          page_with_visible.should be_valid
        end

        it "accurately finds pages before visibility" do
          Page.unscoped do
            Timecop.travel(time_before)
            Page.visible_now.count.should == 2
            Page.visible_now.all.entries.should == [page, page_with_hidden]
          end
        end

        it "accurately finds pages within visibility" do
          Page.unscoped do
            Timecop.travel(time_within)
            Page.visible_now.count.should == 4
            Page.visible_now.all.entries.should == [page, page_with_timing, page_with_hidden, page_with_visible]
          end
        end

        it "accurately finds pages after visibility" do
          Page.unscoped do
            Timecop.travel(time_after)
            Page.visible_now.count.should == 2
            Page.visible_now.all.entries.should == [page, page_with_visible]
          end
        end

      end

    end

  end

end
