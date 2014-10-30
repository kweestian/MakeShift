class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :rating
      t.string :photo
      t.timestamps
    end
  end
end
