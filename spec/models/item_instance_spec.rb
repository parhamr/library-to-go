# encoding: utf-8

require 'spec_helper'

describe ItemInstance do
  it { should validate_presence_of(:condition) }
  
  it { should belong_to(:item).of_type(Item) }

  describe '[instance]' do

    subject { create(:item_instance) }

    describe '#condition' do

      it 'is a String' do
        subject.condition.should be_a(String)
      end

    end

  end
end
