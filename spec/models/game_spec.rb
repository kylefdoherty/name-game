require 'rails_helper'

describe Game do 
  #build 3 teammates with 3 different offices
  let(teammates) {
    [
      Teammate.create(office: "NYC", name: "Bruce Wayne"), 
      Teammate.create(office: "HC"), 
      Teammate.create(office: "LDN")
    ]
  }

  let(game) {Game.create.tap {|n| n.office = "NYC" }}
  #create new game
  #set which office to use 
  #after update the question_groups with questions are built
  describe "#build_game" do 
    it "builds the question_groups and questions for the game from the teammates data" do
      question_group_name = game.question_groups.first.questions.first.text
      
      expect(game.question_groups.length).to eq(1)
      expect(question_group_name).to eq("Bruce Wayne")
    end
  end 
end 
