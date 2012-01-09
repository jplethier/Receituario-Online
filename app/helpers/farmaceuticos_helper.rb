# coding: UTF-8
module FarmaceuticosHelper

  def farmacia_options_for_farmaceutico(selected = nil)
    farmacias_hash = nil
    farmaceutico_corrente.farmacias.each do |farmacia|
      if farmacias_hash.nil?
        farmacias_hash = {farmacia.usuario.nome => farmacia.id}
      else
        farmacias_hash.merge!({farmacia.usuario.nome => farmacia.id})
      end
    end
    options_for_select(farmacias_hash, selected)
  end

end
