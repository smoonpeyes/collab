class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
    @projects = Project.where(user_id: @user.id).all
  end

end