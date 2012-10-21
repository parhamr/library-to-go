# encoding: utf-8

class Person
  include Mongoid::Document

  embeds_many :addresses

end
