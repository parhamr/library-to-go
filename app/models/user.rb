# encoding: utf-8

class User < ActiveRecord::Base
  # INTEGRATIONS
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
          :validatable, :omniauthable, :lockable, :timeoutable
  acts_as_tagger
  acts_as_ordered_taggable_on :languages

  # ASSOCIATIONS
  has_and_belongs_to_many :roles,
                            :readonly => true,
                            :validate => false

  # SECURITY
  # these are exposed for mass-assignment
  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me
  # root can set extra fields
  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me,
                  :email, :password, :password_confirmation, :role_ids, :as => :root

  # VALIDATIONS
  validates :email, :first_name, :last_name, :presence => true
  validates :email, :uniqueness => true
  validates :birthday,
    :date => {:before => Date.today},
    :allow_nil => true

  ### COUNTERS
  # count of items checked out, total (because this references sensitive records)
  # count of items checked out, current (because this references sensitive records)
  # count of searches performed (because this references sensitive records)
  # count of items damaged (for quick reporting)
  # count of holds (for quick reporting)
  # aggregate fees levied by type

  ### DO NOT (directly) STORE
  # search terms
  # which records have been viewed
  # plaintext passwords (obvious)
  # social security number

  ### CONSIDER STORING
  # sex and ethnicity for general statistics
  # 

  # INSTANCE METHODS

  def email=(str)
    # remove whitespace
    write_attribute(:email, str.try(:strip))
  end

  def first_name=(str=nil)
    # remove whitespace
    write_attribute(:first_name, str.try(:strip))
  end

  def last_name=(str=nil)
    # remove whitespace
    write_attribute(:last_name, str.try(:strip))
  end

  # Is this user associated with the passed role?
  def role?(str)
    str.blank? || roles.where( :name => str.downcase ).count > 0
  end

end
