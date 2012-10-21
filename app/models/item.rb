# encoding: utf-8

class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  # The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.
  field :coverage, type: String
  # A point or period of time associated with an event in the lifecycle of the resource.
  field :date, type: Date
  # An account of the resource.
  field :description, type: String
  # The file format, physical medium, or dimensions of the resource.
  field :format, type: Hash
  field :identifier, type: Hash
  field :language, type: String
  field :rights, type: String
  field :title, type: Array
  field :type, type: String
  field :state, type: String, default: 'new'
  
  #has_and_belongs_to_many :subjects, validate: false
  #has_and_belongs_to_many :creators, validate: false
  #has_and_belongs_to_many :publishers, validate: false
  #has_and_belongs_to_many :contributors, validate: false

  has_many :item_instances,
            validate:   false,
            dependent:  :destroy,
            autosave:   false

  validates :title, :language, :type, presence: true

  # TODO: cache this!
  def quantity(force = false)
    {
      circulatable:  quantity_circulatable(force),
      damaged:       quantity_damaged(force),
      reserved:      quantity_reserved(force),
      total:         quantity_total(force),
    }.with_indifferent_access
  end

  def quantity_circulatable(force = false)
    # http://mongoid.org/en/mongoid/docs/querying.html
    # length is cached, count hits the DB
    quantity_total(force) - quantity_reserved(force) - quantity_damaged(force)
  end

  def quantity_damaged(force = false)
    # http://mongoid.org/en/mongoid/docs/querying.html
    # length is cached, count hits the DB
    @quantity_damaged = ((force || !@quantity_damaged) ? item_instances.unscoped.damaged.count : @quantity_damaged)
  end

  def quantity_reserved(force = false)
    # http://mongoid.org/en/mongoid/docs/querying.html
    # length is cached, count hits the DB
    @quantity_reserved = ((force || !@quantity_reserved) ? item_instances.unscoped.reserved.count : @quantity_reserved)
  end

  def quantity_total(force = false)
    # http://mongoid.org/en/mongoid/docs/querying.html
    # length is cached, count hits the DB
    @quantity_total = ((force || !@quantity_total) ? item_instances.unscoped.count : @quantity_total)
  end

end
