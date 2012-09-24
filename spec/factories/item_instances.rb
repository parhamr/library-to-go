# encoding: utf-8

FactoryGirl.define do

  factory :item_instance do
    item
    condition { Item::CONDITION_VALUES_CIRCULATING.sample }
  end

end
