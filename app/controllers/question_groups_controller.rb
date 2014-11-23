class QuestionGroupsController < ApplicationController
  before_action :set_question_group, only: [:show, :update]

  def show
    @game = Game.find(params[:game_id])
    @question1, @question2, @question3 = @question_group.questions
  end

  def update
    question_ids = params[:question_group][:questions]

    question_ids.each do |id|
        Question.find(id).update(correct: true)
    end


    game = Game.find(@question_group.game_id)

    if @question_group.id == game.question_groups.last.id
      game.complete = true
      game.save
      redirect_to root_path
    else
      redirect_to game_question_group_path(game, QuestionGroup.find(@question_group.id + 1))
    end
  end

  private

    def set_question_group
      @question_group = QuestionGroup.find(params[:id])
    end
end

