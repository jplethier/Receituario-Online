class FarmaciaFarmaceutico < ActiveRecord::Base

  belongs_to :farmacia
  belongs_to :farmaceutico

  validates :farmacia,     :presence => true
  validates :farmaceutico, :presence => true

end
