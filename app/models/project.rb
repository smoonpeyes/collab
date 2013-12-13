class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  attr_accessible :body, :title, :description, :user_id, :private, :image
  belongs_to :user

  default_scope order('created_at DESC')

  mount_uploader :image, AvatarUploader

end
