class CreateCurrentProjects < ActiveRecord::Migration
  def change
    create_table :current_projects do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.integer :feedback
      t.timestamps
    end
  end
end
