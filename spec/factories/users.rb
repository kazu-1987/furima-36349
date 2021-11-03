FactoryBot.define do
  factory :user do
    nickname              { 'kazu' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    encrypted_password    { '00000000' }
    first_name            { '尾辻' }
    last_name             { '和孝' }
    first_name_kana       { 'オツジ' }
    last_name_kana        { 'カズタカ' }
    birth_day             { '1987-11-23' }
  end
end
