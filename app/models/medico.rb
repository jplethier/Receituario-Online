class Medico < ActiveRecord::Base

	belongs_to :Usuario

  validates :crm, :presence => true

end
