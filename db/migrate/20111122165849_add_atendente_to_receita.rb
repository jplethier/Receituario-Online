class AddAtendenteToReceita < ActiveRecord::Migration
  
  def change
    add_column :clinicas, :atendente_id, :integer
    add_column :clinicas, :atendente_type, :string
  end
end
