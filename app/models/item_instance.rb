# encoding: utf-8

class ItemInstance
  include Mongoid::Document
  include Mongoid::Timestamps

  field :condition, type: String
  field :price, type: Integer
  field :last_seen_at, type: Time
  field :last_circulated_at, type: Time
  field :state, type: String, default: 'new'

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
  
  belongs_to :item
  #belongs_to :location

  validates :condition, :presence => true

  # STATE MACHINE
  state_machine initial: :new do
    state :processing
    state :available
    state :loaned
    state :circulating

    event :enqueue do
      transition [:new] => :processing
    end
    event :avail do
      transition [:reserved, :loaned, :reserved] => :available
    end
    event :process do
      transition [:new, :processing] => :available
    end
    event :circulate do
      transition [:available, :reserved] => :circulating
    end
    event :reserve do
      transition [:available] => :reserved
    end
    event :withhold do
      transition [:available, :reserved] => :withheld
    end
  end

  scope :damaged, lambda { where(:condition => CONDITIONS_NONCIRCULATING[:damaged]) }
  scope :lost, lambda { where(:condition => CONDITIONS_NONCIRCULATING[:lost]) }
  scope :reserved, lambda { where(:status => STATUS_VALUES[:reserved]) }

  def damaged?
    condition === CONDITION_DAMAGED
  end

  def circulatable?
    CONDITIONS_CIRCULATING.inclue?(condition)
  end

end
