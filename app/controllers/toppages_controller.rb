class ToppagesController < ApplicationController
  def index
    @words = Word.all.page(params[:page]).per(25)
  end
end
