class User < ActiveRecord::Base
  has_many :current_projects
  has_many :projects, through: :current_projects
  
  validates_presence_of :username, :password, :email
end