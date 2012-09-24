# encoding: utf-8

FactoryGirl.define do

  factory :item do
    title     {
                ary = []
                rand(1..3).times do |i|
                  ary << Faker::Lorem.sentence(rand(2..5)).titleize
                end
                ary
              }
    rights    { "© #{rand(1940..Time.now.year)} #{Faker::Company.name} All Rights Reserved" }
    language  'en'
    type      'foo'

    factory :book do
      type 'Text'
      format { {
        :pages => rand(50..800),
        :illustrations => [true, false].sample,
        :type => 'book',
        }.with_indifferent_access }
    end

    factory :painting do
      type 'StillImage'
      format { {} }
    end
  end

end
