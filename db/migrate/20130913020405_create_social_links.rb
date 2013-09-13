class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :name
      t.attachment :photo
      t.string :link
      t.integer :member_id

      t.timestamps
    end
    add_index :social_links, :member_id
  end
end
