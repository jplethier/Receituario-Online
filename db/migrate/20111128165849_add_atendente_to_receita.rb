class AddAtendenteToReceita < ActiveRecord::Migration
  
  def change
    add_column :receitas, :atendente_id, :integer
    add_column :receitas, :atendente_type, :string
  end
end
