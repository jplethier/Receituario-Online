class CreateFarmaciasFarmaceuticos < ActiveRecord::Migration
  def change
    create_table :farmacias_farmaceuticos do |t|
      t.integer :farmacia_id, :null => false
      t.integer :farmaceutico_id, :null => false
      t.date :data_demissao

      t.timestamps
    end
  end
end
