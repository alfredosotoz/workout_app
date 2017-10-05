require 'rails_helper'

RSpec.feature "Hiding signin link" do
  before do
    @alfredo = User.create!(email: "alfredosoto@outlook.com", 
                            password: "123456")
  end
  
  scenario "successfully sign in" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @alfredo.email
    fill_in "Password", with: @alfredo.password
    click_button "Log In"
    
    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end
end
