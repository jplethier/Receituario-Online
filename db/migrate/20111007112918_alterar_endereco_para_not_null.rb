class AlterarEnderecoParaNotNull < ActiveRecord::Migration
  def up
    change_column :farmacias, :endereco, :string, :null => false
  end

  def down
    change_column :farmacias, :endereco, :string, :null => true
  end
end
