class Farmacia < ActiveRecord::Base

  belongs_to :usuario, :autosave => true

  accepts_nested_attributes_for :usuario

  validates :endereco, :presence => true

  attr_accessible :endereco

end
