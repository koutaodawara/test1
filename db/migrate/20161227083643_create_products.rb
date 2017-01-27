class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :text
      t.integer :group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
