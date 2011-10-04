class Medico < ActiveRecord::Base

	belongs_to :usuario

  validates :crm, :presence => true

end
