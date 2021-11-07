FactoryBot.define do
  factory :user do
    employee_number { 'A123456' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_reading { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    nickname { 'たろう' }
    email  {Faker::Internet.free_email}
    password { 'abc123' }
    password_confirmation { password }
  end
end