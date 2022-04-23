class ProjectsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @pagy,@projects = pagy(current_user.projects.order(id: :desc), items:7)
    # @pagy,@projects = pagy(Project.all, items:7)
    
  end
  

  def show
    @project = Project.find(params[:id])
  end


  def new
    # @project = Project.new
    @project = current_user.projects.build
  end

  def create
    # @project = Project.new(project_params)
      @project = current_user.projects.build(project_params)
      
    if @project.save
      flash[:success] = '練習計画が正常に作成されました'
      redirect_to @project
    else
      flash.now[:danger] = '練習計画が正常に作成されませんでした'
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
    redirect_to projects_url
  end
  
  private
  
  # Strong Parameter
  def project_params
      params.require(:project).permit(:plan)
  end  
  
  
  
end
