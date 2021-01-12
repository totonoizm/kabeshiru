FactoryBot.define do
  factory :gym do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    tel { Faker::Lorem.characters(number:10) }
    address { Faker::Lorem.characters(number:10) }
    postcode { Faker::Lorem.characters(number:10) }
    url { Faker::Lorem.characters(number:10) }
    open_time { Faker::Lorem.characters(number:10) }
    price { Faker::Lorem.characters(number:10) }
    holiday { Faker::Lorem.characters(number:10) }
    access { Faker::Lorem.characters(number:10) }
  end
end