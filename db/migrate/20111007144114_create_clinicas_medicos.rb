class CreateClinicasMedicos < ActiveRecord::Migration
  def change
    create_table :clinicas_medicos do |t|
      t.date :data_saida
      t.integer :clinica_id, :null => false
      t.integer :medico_id, :null => false

      t.timestamps
    end
  end
end
