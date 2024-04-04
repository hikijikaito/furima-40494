FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.unique.email }
    password              { 'password1' }
    password_confirmation { 'password1' }
    last_name             { '山田' } # 例: 山田
    first_name            { '太郎' } # 例: 太郎
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
