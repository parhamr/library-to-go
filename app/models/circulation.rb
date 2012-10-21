# encoding: utf-8

class Circulation
  include Mongoid::Document

  belongs_to :item_instance,
              validate: false,
              autosave: false
  belongs_to :location,
              validate: false,
              autosave: false

end
