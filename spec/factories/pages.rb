# encoding: utf-8

FactoryGirl.define do

  factory :page do
    title    { Faker::Lorem.sentence }
    state    'new'

    trait(:approved) do
      after(:create) { |page, ev| page.review!; page.approve! }
    end

    trait(:with_slug) do
      slug { title }
    end

    factory :approved_page, traits: [:with_slug, :approved]
    factory :page_with_slug, traits: [:with_slug]
  end

end
