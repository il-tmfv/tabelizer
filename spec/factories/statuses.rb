FactoryGirl.define do
  factory :status do
    text { Faker::Lorem.characters(5) } 
  end

end
