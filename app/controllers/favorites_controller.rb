class FavoritesController < ApplicationController

  def create
    @like = current_user.like(params[:word_id])
    @word = Word.find(params[:word_id])
  end

  def destroy
    current_user.unlike(params[:id])
    @word = Word.find(params[:id])
  end
  
end