class CreateNeededMaterials < ActiveRecord::Migration
  def change
    create_table :needed_materials do |t|
      t.belongs_to :project
      t.belongs_to :material
      t.timestamps
    end
  end
end
