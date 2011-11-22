class Receita < ActiveRecord::Base

  belongs_to :medico
  belongs_to :paciente
  belongs_to :farmacia
  belongs_to :atendente, :polymorphic => true

  validates :medico,    :presence => true
  validates :paciente,  :presence => true
  validates :descricao, :presence => true

end
