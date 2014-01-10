class ProjectsController < ApplicationController

  def index
    @projects = Project.where(private: false)
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = current_user.projects.build(params[:project])
    authorize @project
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
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if params[:add_collaborator]
      add_collaborator(params, @project)
    else

      if params[:update_project] && @project.update_attributes(params[:project]) 
        flash[:notice] = "Project was updated."
        redirect_to @project
      else
        flash[:error] = "There was an error saving the project. Please try again."
        render :edit
      end
    end
  end

  def add_collaborator(params, project)
    if params[:add_collaborator]
      @collaboration = project.collaborations.create(user_id: params[:user_id])
      if @collaboration.save
        flash[:notice] = "Collaborator added." 
      else
        flash[:error] = "This collaborator has already been added to the project."
        render :edit
      end
    else
      flash[:error] = "There was an error adding a collaborator. Please try again."
      render :edit
    end
  end
end
