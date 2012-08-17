# encoding: utf-8

require 'spec_helper'

describe Role do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  
  describe "#name=" do
    it 'strips whitespace' do
      subject.name = 'test '
      subject.name.should == 'test'
    end
  end
end
