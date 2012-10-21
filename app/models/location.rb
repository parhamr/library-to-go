class Location
  include Mongoid::Document

  embeds_many :addresses

end
