FactoryGirl.define do
  factory :project do
    location 'Russia'
    title 'BestProjectInTheWorld'
    customer { FactoryGirl.build(:customer) }
    status { FactoryGirl.build(:status) }
  end

end
