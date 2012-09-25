# encoding: utf-8

class ItemInstance
  include Mongoid::Document
  include Mongoid::Timestamps

  field :condition, type: String
  field :price, type: Integer
  field :last_seen_at, type: Time
  field :last_circulated_at, type: Time

  CONDITIONS_CIRCULATING = {
    :new          => 'new',
    :good         => 'good',
    :fair         => 'fair',
  }.with_indifferent_access.freeze
  CONDITIONS_NONCIRCULATING = {
    :damaged      => 'damaged',
    :lost         => 'lost',
  }.with_indifferent_access.freeze
  CONDITIONS = {}.
                merge(CONDITIONS_CIRCULATING).
                merge(CONDITIONS_NONCIRCULATING).with_indifferent_access
  CONDITION_VALUES = CONDITIONS.keys

  STATUS_VALUES = {
    :reserved => 'reserved',
  }.with_indifferent_access.freeze
  
  belongs_to :item
  #belongs_to :location

  validates :condition, :presence => true

  scope :damaged, lambda { where(:condition => CONDITIONS_NONCIRCULATING[:damaged]) }
  scope :lost, lambda { where(:condition => CONDITIONS_NONCIRCULATING[:lost]) }
  scope :reserved, lambda { where(:status => STATUS_VALUES[:reserved]) }

  def damaged?
    condition === CONDITION_DAMAGED
  end

end
