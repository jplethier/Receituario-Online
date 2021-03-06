class Farmacia < ActiveRecord::Base

  belongs_to :usuario

  accepts_nested_attributes_for :usuario

  has_many :farmacias_farmaceuticos
  has_many :farmaceuticos, :through => :farmacias_farmaceuticos

  has_many :balconistas_farmacias
  has_many :balconistas, :through => :balconistas_farmacias

  has_many :receitas

  validates :endereco, :presence => true

  attr_accessible :endereco, :usuario_attributes

  def self.por_usuario(usuario)
    where("farmacias.usuario_id = ?", usuario.id)
  end

end
