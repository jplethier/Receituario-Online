class BalconistaFarmacia < ActiveRecord::Base

  belongs_to :farmacia
  belongs_to :balconista

  validates :balconista,   :presence => true
  validates :farmacia,     :presence => true

  def self.por_balconista_e_farmacia(balconista_id, farmacia_id)
    where("balconistas_farmacias.balconista_id = ? and balconistas_farmacias.farmacia_id = ?", balconista_id, farmacia_id).first
  end

  def validar_farmacia_balconista_unicos
    balconista_farmacia = BalconistaFarmacia.por_balconista_e_farmacia(self.balconista_id, self.farmacia_id)
    return true if balconista_farmacia.nil?
    false
  end
  
end
