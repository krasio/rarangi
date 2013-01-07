class AddCompletedToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :completed, :boolean
  end

  def down
    remove_column :entries, :completed
  end
end
