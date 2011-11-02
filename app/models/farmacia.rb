class Farmacia < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  validates :endereco, :presence => true

  attr_accessible :endereco, :usuario_attributes

  def self.por_usuario(usuario)
    where("farmacias.usuario_id = ?", usuario.id)
  end

end
