class JoinGuide < ActiveRecord::Base
  belongs_to :guide
  belongs_to :project
end