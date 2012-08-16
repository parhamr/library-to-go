# encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
          :validatable, :omniauthable, :lockable, :timeoutable

  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me
  # root has extras
  attr_accessible :address1, :address2, :birthday, :company, :country, :description,
                  :first_name, :last_name, :locality, :phone, :postal_code, :region,
                  :time_zone, :title, :remember_me,
                  :email, :password, :password_confirmation, :as => :root

  validates :email, :password, :password_confirmation, :first_name, :last_name, :presence => true
  validates :email, :uniqueness => true

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

end
