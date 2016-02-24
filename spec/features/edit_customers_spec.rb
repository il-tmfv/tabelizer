require 'rails_helper'

RSpec.feature "EditCustomers", type: :feature do
  before(:each) do
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

  scenario "User edits customer" do
    customer = FactoryGirl.create(:customer)

    visit "/customers/#{customer.id.to_s}/edit" 

    fill_in "customer_title", :with => "Changed by capybara"
    click_button "Сохранить"
    expect(page).to have_text("Changed by capybara")
  end

  scenario "User creates customer" do
    visit "/customers/new"
    
    fill_in "customer_title", :with => "Test testy customer"
    fill_in "customer_comment", :with => "Comment fo our testy customer"
    click_button "Сохранить"

    expect(page).to have_text("Test testy customer")
  end

  scenario "User deletes customer" do
    customer = FactoryGirl.create(:customer)

    visit "/customers"

    expect { click_button "Удалить" }.to change(Customer, :count).by(-1)
  end
end
