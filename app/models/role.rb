# encoding: utf-8

class Role
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_and_belongs_to_many :users,
                            autosave: false,
                            validate: false,
                            index: true

  attr_accessible :name, :description, as: :root

  validates :name, uniqueness: true
  validates :name, presence: true, allow_blank: false

  def name=(str=nil)
    # remove whitespace
    self[:name] = str.try(:strip).try(:downcase)
  end

end
