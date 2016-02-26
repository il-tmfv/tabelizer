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
        flash[:notice] = 'Изменения сохранены'
        redirect_to action: :index
      else
        render action: :edit
      end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Создан новый проект'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def destroy
   Project.destroy(params[:id])
   redirect_to action: :index 
  end

  def assign_user
    assignment = Assignment.new(assignment_params)
    assignment.date = Time.now
    assignment.save
    redirect_to action: :index
  end

  private
  def project_params
    params.require(:project).permit(:title, :location, :status_id, :customer_id)
  end

  def assignment_params
    params.permit(:user_id, :project_id)
  end
end
