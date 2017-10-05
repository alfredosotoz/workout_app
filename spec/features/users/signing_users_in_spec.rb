require 'rails_helper'

RSpec.feature "Users signin" do 
   before do 
    @alfredo = User.create!(email: "alfredosoto@outlook.com", password: "123456")
   end
   
   scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @alfredo.email
    fill_in "Password", with: @alfredo.password
    click_button "Log In"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@alfredo.email}")
    
   end
end