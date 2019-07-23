class WordsController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @words = current_user.words.page(params[:page]).per(25)
  end

  def create
    @word = current_user.words.build(word_paramas)
    if @word.save
      flash[:success] = "単語を登録しました"
      redirect_to words_url
    else
      flash.now[:danger] = "単語を登録できませんでした"
      render :new
    end
  end

  def new
    @word = Word.new
  end

  def edit
    @word = Word.find(params[:id])
  end

  def show
    @word = Word.find(params[:id])
    @user = @word.user
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_paramas)
      flash[:success] = "編集に成功しました"
      redirect_to words_url
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to words_url
  end
  
  private
  
  def word_paramas
    params.require(:word).permit(:word, :mean, :example, :category_id)
  end
  
  def correct_user
    @user = Word.find(params[:id]).user
    redirect_to root_url unless current_user?(@user)
  end
  
end
