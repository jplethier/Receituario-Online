class Balconista < ActiveRecord::Base

  belongs_to :usuario

  has_many :balconistas_farmacias
  has_many :farmacias, :through => :balconistas_farmacias

  def self.por_usuario(usuario)
    where("balconistas.usuario_id = ?", usuario.id)
  end

end
