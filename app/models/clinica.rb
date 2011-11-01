class Clinica < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  has_many :clinicas_medicos
  has_many :medicos, :through => :clinicas_medicos

  validates :endereco, :presence => true

  attr_accessible :endereco, :usuario_attributes

end
