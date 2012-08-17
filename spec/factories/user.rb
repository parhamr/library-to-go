# encoding: utf-8

FactoryGirl.define do

  factory :user do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email         { Faker::Internet.email }

    password 'password'
    password_confirmation 'password'

    trait(:member) do
      after(:create) { |user, ev| user.roles << create(:member_role) }
    end

    trait(:admin) do
      after(:create) { |user, ev| user.roles << create(:admin_role) }
    end

    trait(:located) do
      address1       { Faker::Address.street_address }
      address2       { Faker::Address.secondary_address }
      locality       { Faker::Address.city }
      region         { Faker::Address.state }
      postal_code    { Faker::Address.zip_code }
      country        'USA'
      time_zone      'Pacific Time (US & Canada)'
    end

    factory :admin, :traits => [:member, :admin]
    factory :member, :traits => [:member, :located]
    
  end

end
