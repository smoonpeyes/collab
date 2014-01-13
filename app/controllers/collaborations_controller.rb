class CollaborationsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @collaboration = @project.collaborations.create(user_id: params[:user_id])
    if @collaboration.save
      flash[:notice] = "Collaborator added." 
      redirect_to :back
    else
      flash[:error] = "There was an error adding a collaborator. Please try again."
      redirect_to edit_project_path(@project.id)
    end
  end
end
