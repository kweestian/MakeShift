class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.belongs_to :project
      t.belongs_to :type
      t.timestamps
    end
  end
end
