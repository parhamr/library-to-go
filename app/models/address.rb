class Address
  include Mongoid::Document

  embedded_in :user
  ebmedded_in :person

end
