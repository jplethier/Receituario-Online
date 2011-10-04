class DeleteColumnDataCriacao < ActiveRecord::Migration
  def up
    remove_column :receitas, :dataCriacao
  end

  def down
    add_column :receitas, :dataCriacao
  end
end
