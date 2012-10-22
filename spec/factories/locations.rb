# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name { Faker::Company.name }
    alt_names { { abbreviation: 'ABCDEFGHI'.split('').shuffle[0..3] } }
    description { Faker::Lorem.sentence }
    organization
    
  end
end
