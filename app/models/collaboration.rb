class Collaboration < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :email
  belongs_to :user 
  belongs_to :project

  validates_uniqueness_of :user_id, scope: :project_id
end
