class Medico < ActiveRecord::Base

	belongs_to :usuario

  validates :crm, :presence => true

  attr_accessible :crm

end
