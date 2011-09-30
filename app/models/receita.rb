class Receita < ActiveRecord::Base

  belongs_to :medico
  belongs_to :paciente
  belongs_to :farmacia

  validates :medico, :presence => true
  validates :paciente, :presence => true

end
