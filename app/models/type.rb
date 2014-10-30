class Type < ActiveRecord::Base
  has_many :projects, through: :project_types
  has_many :project_types
  
  validates_presence_of :name
end