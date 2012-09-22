# encoding: utf-8

class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  max_versions 10
  #include Mongoid::Taggable

  # STATE MACHINE
  state_machine :initial => :new do
    state :approved
    state :pending_review
    state :rejected
    event :ready_for_review do
      transition :new => :pending_review
    end
    event :approve do
      transition :ready_for_review => :approved
    end
    event :reject do
      transition [:pending_review, :approved] => :rejected
    end
  end
  
  validates :title, :state, :presence => true
  validates :slug, :presence => true,
              :if => :approved?
  validates :slug, :uniqueness => true,
              :if => :approved?
  validates :slug, :format => { :with => Regexp.new(URI::REGEXP::PATTERN::REL_PATH) },
              :if => :approved?
  validates :visible_at,
          :date => {:before => :hidden_at},
          :allow_nil => true
  validates :hidden_at,
          :date => {:after => :visible_at},
          :allow_nil => true
  
  scope :approved, where(:state => 'approved')
  scope :visible_now, lambda {
    where(["(visible_at IS NULL OR visible_at >= ?) AND (hidden_at IS NULL or hidden_at <= ?", Time.now, Time.now])
  }
  scope :visible_to_roles, lambda { |roles|
    tagged_with(roles, :on => :visible_to_roles, :any => true)
  }

  # INSTANCE METHODS

  def slug=(str=nil)
    write_attribute(:slug, str.try(:downcase).try(:strip))
  end
  
end
