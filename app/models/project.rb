class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  attr_accessible :body, :title, :description, :user_id, :private
  belongs_to :user

  default_scope order('created_at DESC')

end
