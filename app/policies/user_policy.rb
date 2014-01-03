class UserPolicy < ApplicationPolicy
  attr_reader :user

    def initialize(user, _)
      @user = user
    end

    def show?
      user
    end
end

