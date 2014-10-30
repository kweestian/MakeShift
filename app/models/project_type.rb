class ProjectType < ActiveRecord::Base
  belongs_to :type
  belongs_to :project
end