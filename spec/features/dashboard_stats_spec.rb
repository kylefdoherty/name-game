require 'rails_helper'

feature "Play a new game" do
  let!(:teammates) {
    [
      create(:teammate, name: "Bruce Wayne", title: "Batman", office: "NYC", team: "Merica", image: "images/batman.jpg"),
      create(:teammate, name: "Doni", title: "Ninja", office: "NYC", team: "TMNT", image: "images/doni.jpg"),
      create(:teammate, name: "David Beckham", title: "Footballer", office: "LDN", team: "Man U", image: "images/david.jpg")
    ]
  }

  # Create new NYC game where player only misses 'team' question for two question groups
  # Game is marked completed 


  # Create a new game but it is not marked completed 
  game_2 = Game.create(office: "LDN")

  scenario "After finishing NYC game and London game, player visits their dashboard" do
    game_1 = Game.create(office: "NYC")
    game_1.question_groups.each do |qg|
      qg.questions.each do |q|
        q.correct = true unless q.label == "team"
      end
    end 
    game_1.complete = true 
    game_1.save

    visit '/'

    expect(page).to have_content("Game Stats")


    expect(page).to have_content("Game 1 - NYC")
    expect(page).to have_content("Completed")
    expect(page).to have_content("100% Names")
    expect(page).to have_content("100% Titles")
    expect(page).to have_content("0% Teams")
    expect(page).to have_content("66% Total")
  end
end

