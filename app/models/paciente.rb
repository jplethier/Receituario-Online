class Paciente < ActiveRecord::Base

  belongs_to :usuario

  def self.por_usuario(usuario)
    where("pacientes.usuario_id = ?", usuario.id)
  end

end
