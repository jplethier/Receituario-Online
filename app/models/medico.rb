class Medico < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  has_many :clinicaMedicos
  has_many :clinicas, :through => :clinicaMedicos
  has_many :receitas

  validates :crm, :presence => true

  attr_accessible :crm, :usuario_attributes

  def self.por_usuario(usuario)
    where("medicos.usuario_id = ?", usuario.id)
  end

  def trabalha_na_clinica?(clinica)
    self.clinicas.each do |c|
      return true if c == clinica
    end
    false
  end

  def self.que_trabalham_na_clinica(clinica)
  end

end
