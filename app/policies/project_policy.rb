class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

    def initialize(user, project)
      @user = user
      @project = project
    end

    # def create?
    #   user.admin? or not project.published?
    # end  
end

# What can be seen by current user
  class ProjectPolicy::Scope < Struct.new(:user, :scope)
    def resolve
      if user.premium?
        scope.all 
      else 
        scope.where(private: false)
      end
    end
  end