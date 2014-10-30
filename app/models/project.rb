class Project < ActiveRecord::Base
  has_many :materials, through: :needed_materials
  has_many :needed_materials

  has_many :types, through: :project_types
  has_many :project_types

  has_many :users, through: :current_projects
  has_many :current_projects

  has_many :guides, through: :join_guides
  has_many :join_guides

  validates_presence_of :name, :rating

  # private

  # def self.search(search)
  # search_condition = "%" + search + "%"
  # find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
  # end

  def match_materials?(other_materials=[])
    intersection = Set.new(self.materials) & other_materials  ## returns materials that are in both self.materials and search_materials
    intersection.count > 0 ? true : false
  end


end