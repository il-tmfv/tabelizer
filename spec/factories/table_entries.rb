FactoryGirl.define do
  factory :table_entry do
    duration 8
    date DateTime.current
    user { FactoryGirl.build(:user) }    
    project { FactoryGirl.build(:project) }
    comment 'It was haaard :('
  end

end
