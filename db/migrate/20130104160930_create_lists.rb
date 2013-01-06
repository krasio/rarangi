class CreateLists < ActiveRecord::Migration
  def up
    create_table :lists do |t|
      t.integer :owner_id
      t.timestamps
    end
    add_index :lists, :owner_id
  end

  def down
    drop_table :lists
  end
end
