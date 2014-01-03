class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

    def initialize(user, project)
      @user = user
      @project = project
    end

    def show?
      project.public? || (user && (is_users_project? || is_collaboration?)) 
    end

    def edit?
      (user && (is_users_project? || is_collaboration?)) 
    end

    def update?
      (user && (is_users_project? || is_collaboration?)) 
    end

    def create?
      user
    end 

    def new?
      user
    end  

    def is_users_project?
      project.user_id == user.id
    end

    def is_collaboration?
      project.collaborations.map{ |c| c.user_id }.include?(user.id)
    end

end

# What can be seen by current user
  class ProjectPolicy::Scope < Struct.new(:user, :scope)
    def resolve
      if user
        scope.where(user_id: user.id) | scope.joins(:collaborations).where(collaborations: {user_id: user.id}) 
      end
    end
  end