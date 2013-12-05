class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
      if @project.save
        flash[:notice] = "Project was saved."
        redirect_to @project
      else
        flash[:error] = "There was an error saving the project. Please try again."
        render :new
      end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project was updated."
      redirect_to @project
    else
      flash[:error] = "There was an error saving the project. Please try again."
      render :edit
    end
  end

end
