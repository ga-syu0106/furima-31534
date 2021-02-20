FactoryBot.define do
  factory :trade_address do
    token             { 'tok_abcdefghijk00000000000000000' }
    postal_code       { '123-4567' }
    prefecture_id       { rand(1..47) }
    municipality          { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name     { '柳ビル' }
    phone_number      { '09012345678' }
  end
end
