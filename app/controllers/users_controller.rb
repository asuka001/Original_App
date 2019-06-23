class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params_user)
    
    if @user.save
      flash[:success] = "登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
  end
  
  def new
    @user = User.new
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
