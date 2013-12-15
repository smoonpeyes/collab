require "./app/policies/project_policy"
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
  flash[:error] = "You are not authorized to perform this action."
  redirect_to request.headers["Referer"] || root_path
  end

  def after_sign_in_path_for(resource)
    projects_path
  end  
end
