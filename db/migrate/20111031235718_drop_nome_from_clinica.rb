class DropNomeFromClinica < ActiveRecord::Migration
  
  def up
    remove_column :clinicas, :nome

  end

  def down
    add_column :clinicas, :nome, :null => false
  end

end
