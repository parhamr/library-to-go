# encoding: utf-8

class Location
  include Mongoid::Document
  include Mongoid::Paranoia

  field :name, type: String
  field :alt_names, type: Hash
  field :description, type: String
  field :state, type: String
  field :urls, type: Hash

  embeds_many :addresses
  # TODO: embedded_in organization?
  belongs_to :organization,
              validate: false,
              autosave: false
  has_many :item_instances,
            validate: false,
            autosave: false,
            dependent: :nullify
  has_many :users,
            inverse_of: :default_location,
            dependent: :nullify,
            validate: false,
            autosave: false

end
