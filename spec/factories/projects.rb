FactoryGirl.define do
  factory :project do
    location { Faker::Address.country }
    title { Faker::Company.name }
    customer { FactoryGirl.create(:customer) }
    status { FactoryGirl.create(:status) }
  end

end
