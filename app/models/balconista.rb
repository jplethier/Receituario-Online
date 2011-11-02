class Balconista < ActiveRecord::Base

  belongs_to :usuario

  def self.por_usuario(usuario)
    where("balconistas.usuario_id = ?", usuario.id)
  end

end
