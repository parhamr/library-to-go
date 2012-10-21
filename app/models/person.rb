class Person
  include Mongoid::Document

  embeds_many :addresses

end
