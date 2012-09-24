# encoding: utf-8

class ItemInstance
  include Mongoid::Document
  include Mongoid::Timestamps

  field :condition, type: String
  field :price, type: Integer
  field :last_seen_at, type: Time
  field :last_circulated_at, type: Time

  CONDITION_VALUES_CIRCULATING = {
    :new          => 'new',
    :good         => 'good',
    :fair         => 'fair',
  }.with_indifferent_access.freeze
  CONDITION_VALUES_NONCIRCULATING = {
    :damaged      => 'damaged',
    :lost         => 'lost',
  }.with_indifferent_access.freeze
  CONDITION_VALUES = CONDITION_VALUES_CIRCULATING.merge(CONDITION_VALUES_NONCIRCULATING)

  STATUS_VALUES = {
    :reserved => 'reserved',
  }.with_indifferent_access.freeze
  
  belongs_to :item
  #belongs_to :location

  validates :condition, :presence => true

  scope :damaged, lambda { where(:condition => CONDITION_VALUES[:damaged]) }
  scope :lost, lambda { where(:condition => CONDITION_VALUES[:lost]) }
  scope :reserved, lambda { where(:status => STATUS_VALUES[:reserved]) }

  def damaged
    condition === CONDITION_DAMAGED
  end

end
