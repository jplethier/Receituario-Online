class CreateReceita < ActiveRecord::Migration
  def change
    create_table :receita do |t|
      t.date :dataCriacao, :null => false
      t.string :descricao
      t.integer :medico_id, :null => false
      t.integer :paciente_id, :null => false
      t.integer :farmacia_id
      t.date :dataAtendimento
      t.integer :farmaceutico_id
      t.integer :balconista_id

      t.timestamps
    end
  end
end
