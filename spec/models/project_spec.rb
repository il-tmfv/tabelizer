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

    it "should return 2" do
        active_status = FactoryGirl.create(:status, :text => 'Активный')
        not_active_status = FactoryGirl.create(:status, :text => 'Завершен')
        project = FactoryGirl.create(:project, :status => active_status)
        project2 = FactoryGirl.create(:project, :title => 'Next Project', :status => active_status)
        expect(Project.active.size).to eq(2)
    end

    it "should return 40" do
        project2 = FactoryGirl.create(:project, :title => 'Next Project')
        project = FactoryGirl.create(:project)
        4.times { FactoryGirl.create(:table_entry, :project => project2) }
        5.times { FactoryGirl.create(:table_entry, :project => project) }
        expect(project.spent_time).to eq(40.0)
    end
end
