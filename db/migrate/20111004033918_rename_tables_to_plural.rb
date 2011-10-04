class RenameTablesToPlural < ActiveRecord::Migration
  def up
    rename_table :receita, :receitas
    rename_table :farmacia, :farmacias
    rename_table :balconista, :balconistas

  end

  def down
    rename_table :receitas, :receita
    rename_table :farmacias, :farmacia
    rename_table :balconistas, :balconista
  end
end
