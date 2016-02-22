require 'rails_helper'

RSpec.feature "EditProjects", type: :feature do
  scenario "User creates project" do
    FactoryGirl.create(:status, :text => "Активный")
    FactoryGirl.create(:status, :text => "Завершен")
    customer = FactoryGirl.create(:customer)
    visit "/projects"
    click_button "Создать"
    fill_in "project_title", :with => "RSpec test project"
    fill_in "project_location", :with => "Russia"
    select "Активный", from: "project_status_id"
    select "#{customer.title}", from: "project_customer_id"
    expect { click_button "Сохранить" }.to change(Project, :count).by(1)
  end
end
