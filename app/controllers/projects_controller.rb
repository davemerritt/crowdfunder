class ProjectsController < ApplicationController
  helper :all
  skip_before_filter :require_login, except: [:edit, :new, :create, :destroy]
 
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else 
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])

    if current_user
      @pledge = @project.pledges.build
    end
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :starttime, :endtime)
  end
end
