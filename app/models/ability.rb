# encoding: utf-8

class Ability
  include CanCan::Ability

  # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  def initialize(user=nil)
    # guest user (not logged in)
    user ||= User.new

    # update your own account
    can [:update], User, :id => user.id unless user.new_record?

    if user.role?('admin')
      # create and update anything
      can [:create, :update], :all
      can [:manage], User
      # read anything
      can [:read], :all
    end

    # PRIVACY: limit each publishing action of users under configurable ages
    # example: comments can only be written by users older than X
    # example: comments can only be read by users older than Y
    # example: items can only be circulated to users older than Z

    # read anything
    can [:read], :all
  end
end
