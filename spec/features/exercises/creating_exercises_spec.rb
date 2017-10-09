require 'rails_helper'

RSpec.feature 'Creating exercises' do 
  before do 
    @alfredo = User.create!(email: "alfredosoto@outlook.com", password: "password")
    login_as(@alfredo)
  end
  
  scenario "with valid inputs" do 
    visit '/'

    click_link "My Lounge"
    click_link "New workout"
    expect(page).to have_link("Back")
    
    fill_in "Duration", with: 70
    fill_in "Workout details", with: "Weight lifting"
    fill_in "Activity date", with: "2016-07-26"
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has been created")
    
    exercise = Exercise.last 
    expect(current_path).to eq(user_exercise_path(@alfredo, exercise))
    expect(exercise.user_id).to eq(@alfredo.id)
  end
  
  scenario "with invalid inputs" do 
    visit '/'
    
    click_link "My Lounge"
    click_link "New workout"
    expect(page).to have_link("Back")
    
    fill_in "Duration", with: ""
    fill_in "Workout", with: ""
    fill_in "Activity date", with: ""
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout details can't be blank")
    expect(page).to have_content("Activity date can't be blank")
  end
end