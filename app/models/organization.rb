# encoding: utf-8

class Organization
  include Mongoid::Document
  include Mongoid::Paranoia

  field :name, type: String
  field :alt_names, type: Hash
  field :description, type: String
  field :state, type: String
  field :urls, type: Hash

  # TODO: embeds_many locations?
  has_many :locations,
            validate: false,
            autosave: false,
            dependent: :destroy

end
