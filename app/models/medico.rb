class Medico < ActiveRecord::Base

	belongs_to :usuario

  accepts_nested_attributes_for :usuario

  has_many :clinicas_medicos
  has_many :clinicas, :through => :clinicas_medicos

  validates :crm, :presence => true

  attr_accessible :crm, :usuario_attributes

  def self.por_usuario(usuario)
    where("medicos.usuario_id = ?", usuario.id)
  end

end
