class Receita < ActiveRecord::Base

  belongs_to :medico
  belongs_to :paciente
  belongs_to :farmacia
  belongs_to :atendente, :polymorphic => true

  validates :medico,    :presence => true
  validates :paciente,  :presence => true
  validates :descricao, :presence => true

  attr_accessible :atendente, :dataAtendimento, :descricao, :farmacia, :medico, :paciente

  def atender(atendente, farmacia)
    self.atendente = atendente
    self.farmacia = farmacia
    self.dataAtendimento = Date.today
    self.save
  end

  def atendida?
    return false if self.dataAtendimento.nil?
    true
  end

end
