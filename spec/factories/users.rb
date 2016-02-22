FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(10) }
    first_name 'Bob'
    last_name 'Smith'
    position { Faker::Company.profession }
  end

end
