FactoryBot.define do
  factory :item do
    name              { Faker::Name }
    explanation       { Faker::Lorem.sentence }
    category_id       { rand(1..10) }
    state_id          { rand(1..6) }
    delivery_free_id  { rand(1..2) }
    prefecture_id     { rand(1..47) }
    days_ship_id      { rand(1..3) }
    price             { rand(300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
