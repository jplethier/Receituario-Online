class Farmaceutico < ActiveRecord::Base

  belongs_to :usuario

  has_many :farmacias_farmaceuticos
  has_many :farmacias, :through => :farmacias_farmaceuticos

  def self.por_usuario(usuario)
    where("farmaceuticos.usuario_id = ?", usuario.id)
  end

end
