class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :done, default: false
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
