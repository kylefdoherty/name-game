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
      create(:teammate,
             name: "Peter Parker",
             title: "Spiderman",
             office: "NYC",
             team: "Merica",
             image: "images/spiderman.jpg"),
      create(:teammate, office: "HK")
    ]
  }

  let(:game) { create(:game, office: "NYC") }

  describe "#game_setup" do
    it "builds the question_groups" do
      expect(game.question_groups.length).to eq(2)
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

  describe "#questions_stats" do 
    it "takes question label as a param * calcs % correct for questions with label" do 
      game.questions.each do |q|
        q.update(correct: true) unless q.label == "team"
      end 

      expect(game.question_stats("name")).to eq(100)
      expect(game.question_stats("title")).to eq(100)
      expect(game.question_stats("team")).to eq(0)
    end 
  end 

  describe "#game_total_stats" do 
    it "calculates percentage of correct title questions" do 
      game.questions.each do |q|
        q.update(correct: true) unless q.label == "team"
      end 

      expect(game.game_total_stats).to eq(66.67)
    end
  end 





end
