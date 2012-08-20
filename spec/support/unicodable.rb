# encoding: utf-8

shared_examples "Unicodable" do
  it "uses the full width of Unicode 3-byte characters in the database and application" do
    # then retrieve it from the DB…
    obj = unicodable.class.find(unicodable.id)
    unicodable_attrs.each do |attr|
      property = obj.send(attr)
      # check for matching strings
      property.should eql(UNICODE_TEST_SEQUENCE)
      # check for matching byte counts
      property.
        bytes.
        to_a.length.
        should eql(UNICODE_TEST_SEQUENCE.bytes.to_a.length)
      # check for matching character counts
      property.
        chars.
        to_a.
        length.
        should eql(UNICODE_TEST_SEQUENCE.chars.to_a.length)
      # and check that the byte count of these multi-byte characters does not match the character count
      property.
        bytes.
        to_a.
        length.
        should_not eql(property)
    end
  end
end

def is_unicodable(klass, attributes)

  let(:unicodable_attrs) { attributes }

  let(:unicodable) {
    pairs = attributes.inject({}) do |hsh, attr|
      hsh[attr] = UNICODE_TEST_SEQUENCE
      hsh
    end
    klass_symbol = klass.to_s.downcase.intern
    create(klass_symbol, pairs)
  }
  it_behaves_like "Unicodable" 
  
end
