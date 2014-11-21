require 'rails_helper'

feature "Play a new game" do
  let!(:teammates) {
    [
      create(:teammate, name: "Bruce Wayne", title: "Batman", office: "NYC", team: "Merica", image: "images/batman.jpg"),
      create(:teammate, name: "Doni", title: "Ninja", office: "NYC", team: "TMNT", image: "images/doni.jpg"),
      create(:teammate, office: "HK")
    ]
  }

  scenario "Visit homepage and click 'Play New Game'" do
    visit '/'
    click_link "Play New Game"

    select "NYC", from: "game_office"
    click_on "Start Game"

    expect(page).to have_content("Game 1")
    expect(page.current_url).to eq("http://www.example.com/games/1/question_groups/1")
    expect(page).to have_content("Bruce Wayne")
    expect(page).to have_content("Batman")
    expect(page).to have_content("Merica")
  end

  scenario "Mark which answers got correct" do
    game = Game.create(office: "NYC")
    qp = QuestionGroup.find(1)

    visit "http://www.example.com/games/1/question_groups/1"

    check("name")
    check("team")
    click_button("Submit")

    expect(qp.questions.first.correct?).to eq(true)
    expect(qp.questions.second.correct?).to eq(false)
    expect(qp.questions.third.correct?).to eq(true)
    expect(page.current_url).to eq("http://www.example.com/games/1/question_groups/2")
  end
end

