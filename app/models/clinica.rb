class Clinica < ActiveRecord::Base

  has_many :clinicas_medicos
  has_many :medicos, :through => :clinicas_medicos


end
