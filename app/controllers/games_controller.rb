class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def index 
    @completed_games = Game.where(complete: true)
  end 

  def create
    @game = Game.new(game_params)
    @game.save

    redirect_to game_question_group_path(@game, @game.question_groups.first)
  end

  private

    def game_params
      params.require(:game).permit(:office)
    end

end
