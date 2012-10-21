class Address
  include Mongoid::Document

  embedded_in :user
  embedded_in :location


end
