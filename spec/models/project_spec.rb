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
end
