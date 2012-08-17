# encoding: utf-8

FactoryGirl.define do

  factory :member_role, :class => 'Role' do
    name 'member'
  end

  factory :admin_role, :class => 'Role' do
    name 'admin'
  end

end
