# encoding: utf-8

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  # INTEGRATIONS
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
          :validatable, :omniauthable, :lockable, :timeoutable
  
  ## Database authenticatable
  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  ## Confirmable
  # field :confirmation_token, type: String
  # field :confirmed_at, type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email, type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token, type: String # Only if unlock strategy is :email or :both
  field :locked_at, type: Time

  ## Token authenticatable
  field :authentication_token, type: String
  index({ email: 1 }, { unique: true, background: true })

  field :first_name, type: String
  field :last_name, type: String
  field :company, type: String
  field :birthday, type: Time
  field :time_zone, type: String
  field :languages, type: Array

  # ASSOCIATIONS
  has_and_belongs_to_many :roles,
                            autosave: false,
                            validate: false,
                            index: true

  # SECURITY
  # these are exposed for mass-assignment
  attr_accessible :birthday, :description, :first_name, :last_name, :title, :phone, :time_zone, :remember_me
  # root can set extra fields
  attr_accessible :birthday, :description, :first_name, :last_name, :title, :phone, :time_zone, :remember_me,
                  :email, :password, :password_confirmation, :role_ids, as: :root
  
  # VALIDATIONS
  validates :email, :first_name, :last_name, :encrypted_password, presence: true
  validates :email, uniqueness: true
  validates :birthday,
    date: {before: Date.today},
    allow_nil: true

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
    self[:email] = str.try(:strip).try(:downcase)
  end

  def first_name=(str=nil)
    # remove whitespace
    self[:first_name] = str.try(:strip)
  end

  def last_name=(str=nil)
    # remove whitespace
    self[:last_name] = str.try(:strip)
  end

  # Is this user associated with the passed role?
  def role?(str)
    str.blank? || roles.where(name: str.downcase).count > 0
  end

  def languages=(ary=[])
    unless ary.instance_of?(Array)
      ary = ary.to_s.split(',')
    end
    self[:languages] = (ary.present? ? ary.map(&:strip) : ary)
  end

end
