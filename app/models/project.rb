class Project < ActiveRecord::Base
  has_many :users
  attr_accessible :body, :title
end
