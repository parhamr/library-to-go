# encoding: utf-8

require 'spec_helper'

describe Role do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should have_and_belong_to_many(:users).of_type(User) }

  it { should_not allow_mass_assignment_of(:name) }

  it { should allow_mass_assignment_of(:name).as(:root) }
  
  describe '[instance]' do

    describe "#name=" do
      it 'strips whitespace' do
        subject.name = 'test '
        subject.name.should == 'test'
      end
    end

  end
end
