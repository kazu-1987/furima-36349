FactoryBot.define do
  factory :item do
    user_id { '1' }
    item_name { '柑橘' }
    description              { '酸っぱい' }
    category_id              { '2' }
    condition_id             { '2' }
    delivery_fee_id { '2' }
    prefecture_id { '2' }
    delivery_day_id          { '2' }
    price                    { '3000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'samle1.png')
    end
  end
end
