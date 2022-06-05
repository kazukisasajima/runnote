class RecordsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @record = Record.new
    @pagy,@records = pagy(current_user.records.order('start_time ASC'), items:7)
  end
  
  def new
    
  end

  def show
    @record = Record.find(params[:id])
  end

  def create
    @record = current_user.records.build(record_parameter)
    
    if @record.save
      flash[:success] = '練習メニューを作成しました'
      redirect_to records_path 
    else
      @pagy,@records = pagy(current_user.records.order('start_time ASC'), items:7)
      flash.now[:danger] = '作成できませんでした。　すべての項目を入力して下さい。'
      render :index
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    flash[:success] = '削除しました'
    redirect_to records_path
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    
    if @record.update(record_parameter)
      flash[:success] = '編集しました'
      redirect_to records_path
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  private

  def record_parameter
    params.require(:record).permit(:train, :result, :review, :start_time)
  end
end
