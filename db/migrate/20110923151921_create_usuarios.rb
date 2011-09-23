class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome,     :null => false
      t.string :cpf_cnpj, :null => false
      t.string :senha,    :null => false
      t.string :email,    :null => false

      t.timestamps
    end
  end
end
