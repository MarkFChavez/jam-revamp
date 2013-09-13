class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.attachment :photo
      t.integer :member_id

      t.timestamps
    end
    add_index :skills, :member_id
  end
end
