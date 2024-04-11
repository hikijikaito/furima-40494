FactoryBot.define do
  factory :item_order do
    association :item
    association :user

    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city_name { Faker::Address.city }
    block_name { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }

    trait :with_item do
      association :item
    end

    trait :with_user do
      association :user
    end
  end
end
