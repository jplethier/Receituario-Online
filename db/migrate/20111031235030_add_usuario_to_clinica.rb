class AddUsuarioToClinica < ActiveRecord::Migration
  def change
    add_column :clinicas, :usuario_id, :integer, :null => false, :default => 0
  end
end
