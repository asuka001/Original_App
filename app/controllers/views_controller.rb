class ViewsController < ApplicationController
  def index
    @words = Word.search(params[:search]).page(params[:page]).per(10)
  end
end
