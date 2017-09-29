require 'rails_helper'

Rspec.feature "Creating Home Page" do 
  scenario do
    visit '/'
    
    expect(page).to have_link('Home')
    expect(page).to have_link('Atheletes Den')
    expect(page).to have_content('Workout Lounge')
    expect(page).to have_content('Show off your workout')
  end
end