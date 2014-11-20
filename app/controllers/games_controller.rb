class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  def create
    @game = Game.new
    @game.save

    redirect_to edit_game_path(@game)
  end  

  def edit
  end 

  def update
    @game.update(game_params)

  end 

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:office)
    end
end 
