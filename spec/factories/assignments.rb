FactoryGirl.define do
  factory :assignment do
    project { FactoryGirl.build(:project) }    
    user { FactoryGirl.build(:user) }
    date DateTime.current
  end

end
