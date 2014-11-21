require 'rails_helper'

describe Game do
  let!(:teammates) {
    [
      create(:teammate,
             name: "Bruce Wayne",
             title: "Batman",
             office: "NYC",
             team: "Merica",
             image: "images/batman.jpg"),
      create(:teammate, office: "HK")
    ]
  }

  let(:game) { create(:game, office: "NYC") }

  describe "#game_setup" do
    it "builds the question_groups" do
      expect(game.question_groups.length).to eq(1)
    end

    it "builds the questions for each question_group" do
      questions = game.question_groups.first.questions
      expect(questions.length).to eq(3)
    end

    it "builds the correct questions for each question group" do
      name = game.question_groups.first.questions.first.text
      title = game.question_groups.first.questions.second.text
      team = game.question_groups.first.questions.third.text

      expect(name).to eq("Bruce Wayne")
      expect(title).to eq("Batman")
      expect(team).to eq("Merica")
    end
  end
end
