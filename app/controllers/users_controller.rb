class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
   def show
    @user = User.find(params[:id])
   end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit; end
  
  def update
    if current_user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした。'
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会処理を実行致しました。'
    redirect_to root_url
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :best, :race, :target)
  end
end
