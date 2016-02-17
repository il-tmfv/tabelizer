class ProjectsController < ApplicationController
  def index
    @projects = Project.all    
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        redirect_to action: :index
      else
        redirect_to action: :edit
      end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def destroy
   Project.destroy(params[:id])
   redirect_to action: :index 
  end

  private
  def project_params
    params.require(:project).permit(:title, :location, :project, :status)
  end

end
