class ToppagesController < ApplicationController
  def index
    @words = Word.all.page(params[:page]).per(6)
  end
end
