class Address
  include Mongoid::Document

  embedded_in :user
  embedded_in :location
  embedded_in :person

end
