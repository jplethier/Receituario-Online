class AddEnderecoToFarmacia < ActiveRecord::Migration
  def up
    add_column :farmacias, :endereco, :string
  end

  def down
    remove_column :farmacias, :endereco
  end
end
