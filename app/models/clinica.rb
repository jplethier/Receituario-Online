class Clinica < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  has_many :clinicas_medicos
  has_many :medicos, :through => :clinicas_medicos
  has_many :receitas

  validates :endereco, :presence => true

  attr_accessible :endereco, :usuario_attributes

  def self.por_usuario(usuario)
    where("clinicas.usuario_id = ?", usuario.id)
  end

end
