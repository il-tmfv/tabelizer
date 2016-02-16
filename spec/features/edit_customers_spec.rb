require 'rails_helper'

RSpec.feature "EditCustomers", type: :feature do
  scenario "User edits customer" do
    customer = FactoryGirl.create(:customer)

    visit "/customer/edit/" + customer.id.to_s

    fill_in "customer_title", :with => "Changed by capybara"
    click_button "Сохранить"
    expect(page).to have_text("Changed by capybara")
  end
end
