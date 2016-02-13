require 'rails_helper'

RSpec.describe User, type: :model do
    it "create Bob by default" do
       user = FactoryGirl.create(:user)
       expect(user.first_name).to eq('Bob')
    end
end
