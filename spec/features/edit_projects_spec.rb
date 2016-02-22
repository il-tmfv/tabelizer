require 'rails_helper'

RSpec.feature "EditProjects", type: :feature do
  before(:each) do
    FactoryGirl.create(:status, :text => "Активный")
    FactoryGirl.create(:status, :text => "Завершен")
  end

  scenario "User creates project" do
    customer = FactoryGirl.create(:customer)
    visit "/projects"
    click_button "Создать"
    fill_in "project_title", :with => "RSpec test project"
    fill_in "project_location", :with => "Russia"
    select "Активный", from: "project_status_id"
    select "#{customer.title}", from: "project_customer_id"
    expect { click_button "Сохранить" }.to change(Project, :count).by(1)
  end

  scenario "User creates and edits project" do
    customer = FactoryGirl.create(:customer)
    visit "/projects"
    click_button "Создать"
    fill_in "project_title", :with => "RSpec test project"
    fill_in "project_location", :with => "Russia"
    select "Активный", from: "project_status_id"
    select "#{customer.title}", from: "project_customer_id"
    click_button "Сохранить"
    click_button "Редактировать"
    fill_in "project_title", :with => "Edited project"
    click_button "Сохранить"
    expect(page).to have_text "Edited project"
  end

  scenario "User creates and deletes project" do
    customer = FactoryGirl.create(:customer)
    visit "/projects"
    click_button "Создать"
    fill_in "project_title", :with => "RSpec test project"
    fill_in "project_location", :with => "Russia"
    select "Активный", from: "project_status_id"
    select "#{customer.title}", from: "project_customer_id"
    click_button "Сохранить"
    expect { click_button "Удалить" }.to change(Project, :count).by(-1)
  end
end
