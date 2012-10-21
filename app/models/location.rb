class Location
  include Mongoid::Document

  embeds_many :addresses
  belongs_to :organization,
              validate: false,
              autosave: false,
              index: true,
              dependent: :nullify

end
