class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  attr_accessible :body, :title, :description, :user_id, :private, :image, :avatar
  belongs_to :user
  belongs_to :owner

  has_many :users

  default_scope order('created_at DESC')

  mount_uploader :image, AvatarUploader

end
