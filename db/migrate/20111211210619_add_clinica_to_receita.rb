class AddClinicaToReceita < ActiveRecord::Migration
  def change
    add_column :receitas, :clinica_id, :integer
  end
end
