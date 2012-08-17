# encoding: utf-8

class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  attr_accessible :name, :as => :root

end
