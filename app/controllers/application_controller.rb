require "./app/policies/project_policy"
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_filter :verify_authorized, :except => :index
end
