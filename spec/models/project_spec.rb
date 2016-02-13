require 'rails_helper'

RSpec.describe Project, type: :model do
    it "needs to be long" do
        project = FactoryGirl.build(:project, :location => 'Russia')
        expect(project).to be_valid
    end

    it "needs to be long" do
        project = FactoryGirl.build(:project, :location => 'NY')
        expect(project).to be_invalid
    end

    it "should has unique title" do
        project = FactoryGirl.create(:project)
        project2 = FactoryGirl.build(:project)
        expect(project2).to be_invalid
    end

    it "should has unique title" do 
        project = FactoryGirl.create(:project)
        project2 = FactoryGirl.build(:project, :title => 'Something')
        expect(project2).to be_valid
    end
end
