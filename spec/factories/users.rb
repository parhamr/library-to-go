# encoding: utf-8

FactoryGirl.define do

  factory :user do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email         { Faker::Internet.email }

    password 'password'
    password_confirmation 'password'

    trait(:member) do
      after(:create) do |user, ev|
        user.roles << (Role.where(:name => 'member').first || create(:member_role))
        user.save!
      end
    end

    trait(:admin) do
      after(:create) do |user, ev|
        user.roles << (Role.where(:name => 'admin').first || create(:admin_role))
        user.save!
      end
    end

    trait(:located) do
      # associate an address!
      time_zone      'Pacific Time (US & Canada)'
    end

    factory :admin, :traits => [:member, :admin]
    factory :member, :traits => [:member, :located]
    
  end

end
