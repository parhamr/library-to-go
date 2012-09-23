# encoding: utf-8

class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include PagePresenter
  max_versions 10
  
  field :title, type: String
  field :slug, type: String
  field :contents, type: String
  field :visible_at, type: Time
  field :hidden_at, type: Time
  field :state, type: String, default: 'new'

  attr_accessible :title, :contents, :visible_at, :hidden_at, :slug
  attr_accessible :title, :contents, :visible_at, :hidden_at, :slug, as: :root

  # STATE MACHINE
  state_machine initial: :new do
    state :approved
    state :pending_review
    state :rejected
    event :review do
      transition :new => :pending_review
    end
    event :approve do
      transition pending_review: :approved
    end
    event :reject do
      transition [:pending_review, :approved] => :rejected
    end
  end
  
  validates :title, :state, presence: true, allow_blank: false
  validates :slug, presence: true,
              :if => :approved?
  validates :slug, uniqueness: { case_sensitive: false },
              :if => :approved?
  validates :slug, format: { with: Regexp.new(URI::REGEXP::PATTERN::REL_PATH) },
              :if => :approved?
  validates :visible_at,
          date: { before: :hidden_at},
          allow_nil: true,
          :if => :hidden_at?
  validates :hidden_at,
          date: { after: :visible_at},
          allow_nil: true,
          :if => :visible_at?
  
  scope :approved, where(state: 'approved')
  scope :visible_now, lambda {
    where('$or' => [
      {visible_at: nil, hidden_at: nil},
      {visible_at: nil, hidden_at: {'$gte' => Time.now}},
      {hidden_at: nil, visible_at: {'$lte' => Time.now}},
      {visible_at: {'$lte' => Time.now}, hidden_at: {'$gte' => Time.now}}
    ])
  }
  scope :visible_to_roles, lambda { |roles|
    tagged_with(roles, on: :visible_to_roles, any: true)
  }

  default_scope lambda { approved.visible_now }

  before_validation :clean_up_slug

  # INSTANCE METHODS

  private

  def clean_up_slug
    write_attribute(:slug, (read_attribute(:slug).present? ? read_attribute(:slug).gsub(/[<>"|:&.\/?%*]/,'').tr_s(' ','-').strip : nil))
  end
  
end
