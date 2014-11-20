require 'rails_helper'

describe Game do
  #build 3 teammates with 3 different offices
  #make these factories later
  let!(:teammates) {
    [
      create(:teammate, name: "Bruce Wayne", title: "Batman", office: "NYC", team: "Merica", image: "images/batman.jpg"),
      create(:teammate, office: "HK")
    ]
  }

  let(:game) { create(:game, office: "NYC") }

  describe "#game_setup" do
    it "builds the question_groups" do
      game.game_setup

      expect(game.question_groups.length).to eq(1)
    end

    it "builds the questions for each question_group" do
      game.game_setup

      questions = game.question_groups.first.questions
      expect(questions.length).to eq(3)
    end

    it "builds the correct questions for each question group" do
      game.game_setup

      name_quesiton = game.question_groups.first.questions.first.text
      title_question = game.question_groups.first.questions.second.text
      team_question = game.question_groups.first.questions.third.text

      expect(name_quesiton).to eq("Bruce Wayne")
      expect(title_question).to eq("Batman")
      expect(team_question).to eq("Merica")
    end
  end
end
