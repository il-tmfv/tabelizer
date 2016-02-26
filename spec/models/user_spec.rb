require 'rails_helper'

RSpec.describe User, type: :model do
  it "create Bob by default" do
   user = FactoryGirl.build(:user)
   expect(user.first_name).to eq('Bob')
  end

  it "check if first_name is empty" do
    user = FactoryGirl.build(:user, :first_name => '')
    expect(user).to be_invalid
  end

  it "check if last_name is empty" do
    user = FactoryGirl.build(:user, :last_name => '')
    expect(user).to be_invalid
  end

  it "check if position is empty" do
    user = FactoryGirl.build(:user, :position => '')
    expect(user).to be_invalid
  end

  it "check if user spent correct time on project" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)   
    project1 = FactoryGirl.create(:project)
    project2 = FactoryGirl.create(:project)
    5.times do
      FactoryGirl.create(:table_entry, :user => user1, :project => project1)
    end
    expect(user1.spent_time_on project1).to eq(40.0)
    expect(user1.spent_time_on project2).to eq (0.0)
  end
end
