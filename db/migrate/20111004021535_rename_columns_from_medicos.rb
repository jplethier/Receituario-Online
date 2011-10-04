class RenameColumnsFromMedicos < ActiveRecord::Migration
  def up
    rename_column :medicos, :user_id, :usuario_id
    rename_column :medicos, :orm, :crm
  end

  def down
    rename_column :medicos, :usuario_id, :user_id
    rename_column :medicos, :crm, :orm
  end
end
