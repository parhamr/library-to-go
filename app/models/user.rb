# encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
          :validatable, :omniauthable, :lockable, :timeoutable

  has_and_belongs_to_many :roles,
                            :readonly => true,
                            :validate => false

  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me
  # root can set extra fields
  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me,
                  :email, :password, :password_confirmation, :role_ids, :as => :root

  validates :email, :first_name, :last_name, :presence => true
  validates :email, :uniqueness => true

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

  def email=(str)
    # remove whitespace
    write_attribute(:email, str.strip) if str.present?
  end

  def first_name=(str)
    # remove whitespace
    write_attribute(:first_name, str.strip) if str.present?
  end

  def last_name=(str)
    # remove whitespace
    write_attribute(:last_name, str.strip) if str.present?
  end

  # Is this user associated with the passed role?
  def role?(str)
    roles.where( :name => str.downcase ).count > 0
  end

end
