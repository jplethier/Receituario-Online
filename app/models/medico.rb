class Medico < ActiveRecord::Base

	belongs_to :usuario

  has_many :clinicas_medicos
  has_many :clinicas, :through => :clinicas_medicos

  validates :crm, :presence => true

  attr_accessible :crm

end
