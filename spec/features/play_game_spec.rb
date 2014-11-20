require 'rails_helper'

feature "Play a new game" do
  scenario "Visit homepage and click 'Play New Game'" do 
    visit '/'
    click_link "Play New Game"

    expect(page).to have_content "Game 1"
    expect(page).to have_content "NYC"
    expect(page.current_url).to eq("http://www.example.com/games/1/edit")
  end 

  scenario "Visit game edit page, select office, and start game" do 
    Game.create
    visit "http://localhost:3000/games/1/edit"
    select "NYC", from: "game_office"
    click_on "Start Game"

    expect(page).to have_content("Game 1 - Teammate 1")
  end 
end 

 
