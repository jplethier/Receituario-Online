class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.integer :user_id, :null => false
      t.string :orm, :null => false

      t.timestamps
    end
  end
end
