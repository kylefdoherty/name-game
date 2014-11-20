require 'rails_helper'

feature "Playing a new game" do 
  scenario "Visit homepage and click 'Play New Game'" do 
    visit '/'
    click_link "Play New Game"

    expect(page).to have_content "Game 1"
    expect(page.current_url).to eq("http://www.example.com/games")
    # expect(page).to have checkboxes NYC, Lon, HK, Dubai, All
    # expect(page).to have content "Start Game"
  end 
end 