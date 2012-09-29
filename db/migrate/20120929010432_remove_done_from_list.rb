class RemoveDoneFromList < ActiveRecord::Migration
  def up
    remove_column :lists, :done
  end

  def down
    add_column :lists, :done, :boolean
  end
end
