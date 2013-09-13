class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.integer :member_id

      t.timestamps
    end
    add_index :projects, :member_id
  end
end
