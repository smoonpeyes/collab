class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

    def initialize(user, project)
      @user = user
      @project = project
    end

    def edit?
      user && project.user_id == user.id
    end

    def update?
      user && project.user_id == user.id
    end

    def create?
      user
    end 

    def new?
      user
    end  

end

# What can be seen by current user
  class ProjectPolicy::Scope < Struct.new(:user, :scope)
    def resolve
      if user && user.premium?
        scope.where(user_id: user.id) | scope.where(private: false) | Collaboration.where(user_id: user.id)
      else 
        scope.where(private: false) | Collaboration.where(user_id: user.id)
      end
    end
  end