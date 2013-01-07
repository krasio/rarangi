class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.references :list
      t.string :content
      t.timestamps
    end
    add_index :entries, :list_id
  end

  def down
    drop_table :entries
  end
end
