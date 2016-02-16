require 'rails_helper'

RSpec.feature "EditCustomers", type: :feature do
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
end
