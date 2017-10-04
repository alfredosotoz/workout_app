require 'rails_helper'

RSpec.feature "Signing out users" do
  before do 
    @alfredo = User.create!(email: "alfredosoto@outlook.com", password: "123456")
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @alfredo.email
    fill_in "Password", with: @alfredo.password
    click_button "Log in"
  end
  
  scenario do 
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end