class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録成功"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザ登録失敗"
      render :new
    end 
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end 
end
