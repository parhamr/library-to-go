# encoding: utf-8

FactoryGirl.define do

  factory :item_instance do
    item
    condition { ItemInstance::CONDITIONS[:new] }
    state 'new'

    trait(:damaged) do
      condition { ItemInstance::CONDITIONS[:damaged] }
    end
  end

end
