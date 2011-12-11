class FarmaciaFarmaceutico < ActiveRecord::Base

  belongs_to :farmacia
  belongs_to :farmaceutico

  validates :farmacia,     :presence => true
  validates :farmaceutico, :presence => true


  def self.por_farmaceutico_e_farmacia(farmaceutico_id, farmacia_id)
    where("farmacias_farmaceuticos.farmaceutico_id = ? and farmacias_farmaceuticos.farmacia_id = ?", farmaceutico_id, farmacia_id).first
  end

  def validar_farmacia_farmaceutico_unicos
    farmacia_faramaceutico = FarmaciaFarmaceutico.por_farmaceutico_e_farmacia(self.farmaceutico_id, self.farmacia_id)
    return true if farmacia_faramaceutico.nil?
    false
  end

end
