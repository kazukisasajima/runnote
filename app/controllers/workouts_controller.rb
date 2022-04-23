class WorkoutsController < ApplicationController
    
  def index
    @user = current_user
    @pagy, @workouts = pagy(Workout.all, items: 7)

  end

  def show
    @workout = Workout.find(params[:id])  
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    
    if @workout.save
      flash[:success] = 'taskが正常に作成されました'
      redirect_to @workout
    else
      flash.now[:danger] = 'taskが正常に作成されませんでした'
      render :new
    end
  end

  def edit
    @workout =Workout.find(params[:id])
  end

  def update 
    @workout = Workout.find(params[:id])
    
    if @workout.update(message_params)
      flash[:success] = 'taskは正常に更新されました'
      redirect_to @workout
    else
      flash.now[:danger] = 'taskは更新されませんでした'
      render :edit
    end  
  end

  def destroy
    @workout =Workout.find(params[:id])
    @workout.destroy
    
    flash[:success] = 'taskは正常に削除されました'
    redirect_to workouts_url
  end

  
  private
  
  
  #Strong Parameter
  def workout_params
    params.require(:workout).permit(:task)
  end  

end


