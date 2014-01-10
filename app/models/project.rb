class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :body, :title, :description, :user_id, :private, :email
  belongs_to :user

  has_many :users, :through => :collaborations, :dependent => :destroy
  has_many :collaborations

  default_scope order('created_at DESC')

  def public?
    !private
  end

end
