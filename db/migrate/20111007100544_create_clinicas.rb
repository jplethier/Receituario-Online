class CreateClinicas < ActiveRecord::Migration
  def change
    create_table :clinicas do |t|
      t.string :nome, :null => false
      t.string :endereco, :null => false

      t.timestamps
    end
  end
end
