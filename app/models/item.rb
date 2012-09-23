# encoding: utf-8

class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  # The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.
  field :coverage, type: String
  # A point or period of time associated with an event in the lifecycle of the resource.
  field :date, type: Date
  # An account of the resource.
  field :description, type: String
  # The file format, physical medium, or dimensions of the resource.
  field :format, type: String
  field :identifier, type: String
  field :language, type: String
  field :rights, type: String
  field :title, type: Array
  field :type, type: String
  
  # The topic of the resource.
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :creators
  has_and_belongs_to_many :publishers
  has_and_belongs_to_many :contributors

end
