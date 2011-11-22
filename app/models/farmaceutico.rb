class Farmaceutico < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  attr_accessible :usuario_attributes

  has_many :farmacias_farmaceuticos
  has_many :farmacias, :through => :farmacias_farmaceuticos

  has_many :receitas, :as => :atendente

  def self.por_usuario(usuario)
    where("farmaceuticos.usuario_id = ?", usuario.id)
  end

end
