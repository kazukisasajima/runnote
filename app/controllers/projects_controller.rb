class ProjectsController < ApplicationController
    
  def index
    # @projects = Project.all
    @pagy,@projects = pagy(Project.all, items:7)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new  
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      flash[:success] = '練習計画が正常に作成されました'
      redirect_to @project
    else
      flash.now[:danger] = '練習計画が正常に作成されました'
      render :new
    end  
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    
    if @project.update(project_params)
      flash[:success] = '練習計画は正常に更新されました'
      redirect_to @project
    else
      flash.now[:danger] = '練習計画は更新されませんでした'
      render :edit
    end  
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    flash[:success] = '練習計画は正常に削除されました'
    redirect_to project_url
  end
  
  private
  
  # Strong Parameter
  def project_params
      params.require(:project).permit(:plan)
  end  
  
  
  
end
