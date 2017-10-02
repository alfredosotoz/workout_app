require 'rails_helper'

RSpec.feature "A user signs up" do
  scenario "with valid credentials" do 
    visit "/"
    
    click_link "Sign up"
    fill_in "Email", with: "alfredosoto@outlook.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")
  end
end