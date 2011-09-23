class CreateFarmacia < ActiveRecord::Migration
  def change
    create_table :farmacia do |t|
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
