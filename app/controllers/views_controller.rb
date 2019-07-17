class ViewsController < ApplicationController
  def index
    @words = Word.all.page(params[:page]).per(10)
  end
end
