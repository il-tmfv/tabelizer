require 'rails_helper'

RSpec.feature "EditProjects", type: :feature do
  before(:each) do
    @active_status = FactoryGirl.create(:status, :text => "Активный")
    FactoryGirl.create(:status, :text => "Завершен")
    visit "/"
    click_link "Регистрация"
    fill_in "user_email", :with => "me@me.com"
    fill_in "user_password", :with => "12345678"
    fill_in "user_password_confirmation", :with => "12345678"
    fill_in "user_first_name", :with => "John"
    fill_in "user_last_name", :with => "Doe"
    fill_in "user_position", :with => "test"
    click_button "Регистрация"
   end

  scenario "User gets assigned to the project" do
    customer = FactoryGirl.create(:customer)
    project = FactoryGirl.create(:project, :title => "test project", :status => @active_status, :customer => customer)
    visit "/"
    click_link "test project"
    expect { click_button "Присоединиться" }.to change(Assignment, :count).by(1)
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
    click_link "RSpec test project"
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
    click_link "RSpec test project"
    expect { click_button "Удалить" }.to change(Project, :count).by(-1)
  end
end
