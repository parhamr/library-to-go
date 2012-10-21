# encoding: utf-8

class Location
  include Mongoid::Document

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
