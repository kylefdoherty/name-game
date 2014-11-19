class GamesController < ApplicationController
  before_action :set_game, only: [:edit]

  def create
    @game = Game.new
    @game.save

    render :edit
  end  

  def edit 
  end 

  private

    def set_game
      @game = Game.find(params[:id])
    end
end 
