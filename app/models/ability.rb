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
      # read anything
      can [:read], :all
    end

    # read anything
    can [:read], :all
  end
end
