class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :role
      t.text :description

      t.timestamps
    end
  end
end
