class BalconistaFarmacia < ActiveRecord::Base

  belongs_to :farmacia
  belongs_to :balconista

  validates :balconista,   :presence => true
  validates :farmacia,     :presence => true
  
end
