class CreateBalconista < ActiveRecord::Migration
  def change
    create_table :balconista do |t|
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
