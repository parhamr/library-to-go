# encoding: utf-8

class Role < ActiveRecord::Base

  has_and_belongs_to_many :users,
                            :readonly => true,
                            :validate => false

  attr_accessible :name, :description, :as => :root

  validates :name, :uniqueness => true
  validates :name , :presence => true

  def name=(str=nil)
    # remove whitespace
    write_attribute(:name, str.try(:strip))
  end

end
