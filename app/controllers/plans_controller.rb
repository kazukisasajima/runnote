class PlansController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @plan = Plan.new
    @pagy,@plans = pagy(current_user.plans.order(id: :desc), item:7)
  end
  
  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = current_user.plans.build(plan_parameter)

    if @plan.save
      flash[:success] = '練習メニューを作成しました'
      redirect_to plans_path
    else
      flash.now[:danger] = '作成できませんでした'
      render :index
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = '削除しました'
    redirect_to plans_path
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    
    if @plan.update(plan_parameter)
      flash[:success] = '編集しました'
      redirect_to plans_path
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  private

  def plan_parameter
    params.require(:plan).permit(:menu, :time, :detail, :start_time)
  end
end
