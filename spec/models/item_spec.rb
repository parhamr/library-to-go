# encoding: utf-8

require 'spec_helper'

describe Item do
  it { should validate_presence_of(:language) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:title) }
  
  it { should have_many(:item_instances).of_type(ItemInstance) }

  describe '[instance]' do

    subject { create(:item) }
    let(:book_with_one_instance) { create(:book, :with_one_instance) }
    let(:book_with_damage) { create(:book, :with_damage) }

    describe '#title' do

      it 'is an Array' do
        subject.title.should be_a(Array)
      end

    end

    describe '#quantity' do
      it 'is a Hash' do
        subject.quantity.should be_a(Hash)
      end

      context 'when cached' do

        it 'fails to increment as item_instances are added'

      end

      context 'when not cached' do

        it 'increments as item_instances are added'

      end
    end

    describe '#quantity_circulatable' do
      it 'is a Fixnum' do
        subject.quantity_circulatable.should be_a(Fixnum)
      end

      it 'counts the number of associated ItemInstance records that are circulatable' do
        book_with_damage.quantity_circulatable.should eq 0
      end
    end

    describe '#quantity_damaged' do
      it 'is a Fixnum' do
        subject.quantity_damaged.should be_a(Fixnum)
      end

      it 'counts the number of associated ItemInstance records that are damaged' do
        book_with_one_instance.quantity_damaged.should eq 0
        book_with_damage.quantity_damaged.should eq 1
      end
    end

    describe '#quantity_reserved' do
      it 'is a Fixnum' do
        subject.quantity_reserved.should be_a(Fixnum)
      end

      it 'counts the number of associated ItemInstance records that are reserved' do
        book_with_one_instance.quantity_reserved.should eq 0
        book_with_damage.quantity_reserved.should eq 0
      end
    end

    describe '#quantity_total' do
      it 'is a Fixnum' do
        subject.quantity_total.should be_a(Fixnum)
      end

      it 'counts the number of associated ItemInstance records' do
        book_with_one_instance.quantity_total.should eq 1
        book_with_damage.quantity_total.should eq 1
      end
    end

    context 'for a book' do
      subject { create(:book) }
      let(:arbitrary_hash) { {:foo => 'bar'}.with_indifferent_access }

      it 'is an item' do
        subject.should be_a(Item)
      end

      describe '#type' do
        it 'is Text' do
          subject.type.should == 'Text'
        end
      end

      describe '#format' do
        it 'is a Hash' do
          subject.format.should be_a(Hash)
        end

        it 'accepts arbitrary keys' do
          subject.format = arbitrary_hash
          subject.format.should have_key(:foo)
          subject.format.should eq arbitrary_hash
        end
      end

      describe '#language' do
        it 'is a String' do
          subject.language.should be_a(String)
        end
      end

    end

  end
end
