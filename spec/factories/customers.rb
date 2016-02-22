FactoryGirl.define do
  factory :customer do
    title { Faker::Company.name }
    comment { Faker::Company.bs }
  end

end
