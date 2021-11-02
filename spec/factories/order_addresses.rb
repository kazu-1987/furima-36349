FactoryBot.define do
  factory :order_address do
    postal_code       {"111-1111"}
    prefecture_id     {"2"}
    city              {"横浜"}
    house_number      {"1"}
    building          {"ビル"}
    phone_number      {"09012345678"} 
    token {"tok_abcdefghijk00000000000000000"}
  end
end
