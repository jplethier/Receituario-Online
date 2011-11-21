class CreateBalconistasFarmacias < ActiveRecord::Migration
  def change
    create_table :balconistas_farmacias do |t|
      t.integer :balconista_id, :null => false
      t.integer :farmacia_id, :null => false
      t.date :data_demissao

      t.timestamps
    end
  end
end
