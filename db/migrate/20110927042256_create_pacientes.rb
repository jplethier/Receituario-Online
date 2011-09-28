class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
