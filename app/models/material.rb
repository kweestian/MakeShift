class Material < ActiveRecord::Base
  has_many :projects, through: :needed_materials
  has_many :needed_materials
  validates_presence_of :name
end