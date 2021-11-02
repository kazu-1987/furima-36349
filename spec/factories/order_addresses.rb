FactoryBot.define do
  factory :order_address do
    postal_code       {"111-1111"}
    prefecture_id     {"2"}
    city              {"横浜"}
    house_number      {"1"}
    building          {"ビル"}
    phone_number      {"09012345678"} 
  end
end
