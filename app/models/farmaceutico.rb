class Farmaceutico < ActiveRecord::Base

  belongs_to :usuario

  def self.por_usuario(usuario)
    where("farmaceuticos.usuario_id = ?", usuario.id)
  end

end
