class CreateFarmaceuticos < ActiveRecord::Migration
  def change
    create_table :farmaceuticos do |t|
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
