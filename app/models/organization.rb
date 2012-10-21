# encoding: utf-8

class Organization
  include Mongoid::Document

  # TODO: embeds_many locations?
  has_many :locations,
            validate: false,
            autosave: false,
            dependent: :destroy

end
