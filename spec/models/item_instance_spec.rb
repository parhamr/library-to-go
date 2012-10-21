# encoding: utf-8

require 'spec_helper'

describe ItemInstance do
  it { should validate_inclusion_of(:condition) }
  
  it { should belong_to(:item).of_type(Item) }

  describe '[instance]' do

    subject { create(:item_instance) }

    describe '#condition' do

      it 'is a String' do
        subject.condition.should be_a(String)
      end

    end

    describe 'state machine' do
      let(:any_current_event) { "#{subject.state_paths(from: subject.state).sample.first.event}!" }

      it 'is integrated' do
        subject.should respond_to(:fire_state_event)
      end

      it 'provides events' do
        expect do
          # pick any event and call it
          subject.method(any_current_event).call
        end.to change(subject, :state)
      end

      describe '#lost!' do

        it 'transitions to withheld' do
          expect do
            subject.process!
            subject.lost!
          end.to change(subject, :state).to('withheld')
        end

      end

    end

  end
end
