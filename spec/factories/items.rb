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
    # location
    # attachments
    # restrictions
    # circulatable
    # reservable

    trait(:with_one_instance) do
      after(:create) { |i| i.item_instances << create(:item_instance, :item => i) }
    end

    trait(:with_damage) do
      after(:create) { |i| i.item_instances << create(:item_instance, :damaged, :item => i) }
    end

    factory :book do
      type 'Text'
      format { {
        :pages => rand(50..800),
        :illustrations => [true, false].sample,
        :type => 'book',
        }.with_indifferent_access }
        # dimensions
        # ISBN
    end

    factory :painting do
      type 'StillImage'
      format { {} }
    end
  end

end
