class Organization
  include Mongoid::Document

  has_many :locations,
            validate: false,
            autosave: false,
            index: true,
            dependent: :destroy

end
