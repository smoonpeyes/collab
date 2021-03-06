class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, 
                  :premium, :avatar, :avatar_cache, :subscriptions, :stripe_token
  
  has_many :projects
  has_many :subscriptions
  has_many :collaborations

  mount_uploader :avatar, AvatarUploader
end

