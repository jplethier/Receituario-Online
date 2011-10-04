class RenameUserIdColumns < ActiveRecord::Migration
  def up
    rename_column :balconista, :user_id, :usuario_id
    rename_column :pacientes, :user_id, :usuario_id
    rename_column :farmacia, :user_id, :usuario_id
    rename_column :farmaceuticos, :user_id, :usuario_id
  end

  def down
    rename_column :balconista, :usuario_id, :user_id
    rename_column :pacientes, :usuario_id, :user_id
    rename_column :farmacia, :usuario_id, :user_id
    rename_column :farmaceuticos, :usuario_id, :user_id
  end
end
