class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :instruction
      t.timestamps
    end
  end
end
