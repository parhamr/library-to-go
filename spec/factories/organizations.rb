# encoding: utf-8

FactoryGirl.define do
  factory :organization do
    name { Faker::Company.name }
    alt_names { { abbreviation: 'ABCDEFGHI'.split('').shuffle[0..3] } }
    description { Faker::Lorem.sentence }


    trait(:with_locations) do
      locations { [create(:location), create(:location)] }
    end
    
  end



end
