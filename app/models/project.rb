class Project < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :private
  belongs_to :user

  default_scope order('created_at DESC')
end
