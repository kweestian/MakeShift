class Guide < ActiveRecord::Base
  has_many :join_guides
  has_many :projects, through: :join_guides
  # validates_presence_of :instruction
end