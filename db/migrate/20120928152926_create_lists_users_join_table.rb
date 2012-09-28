class CreateListsUsersJoinTable < ActiveRecord::Migration
  def up
    create_table :lists_users, :id => false do |t|
      t.integer :user_id
      t.integer :list_id
    end
  end

  def down
    drop_table :lists_users
  end
end
