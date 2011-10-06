class Farmacia < ActiveRecord::Base

  belongs_to :usuario

  validates :endereco, :presence => true

end
