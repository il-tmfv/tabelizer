FactoryGirl.define do
  factory :project do
    location 'Russia'
    customer FactoryGirl.build(:customer)
  end

end
