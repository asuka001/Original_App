class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to root_url
    end
  end
  
end
