class Medico < ActiveRecord::Base

	belongs_to :Usuario

  validates :orm, :presence => true

end
