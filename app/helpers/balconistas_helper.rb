module BalconistasHelper

  def farmacia_options_for_balconista(selected = nil)
    farmacias_hash = nil
    balconista_corrente.farmacias.each do |farmacia|
      if farmacias_hash.nil?
        farmacias_hash = {farmacia.usuario.nome => farmacia.id}
      else
        farmacias_hash.merge!({farmacia.usuario.nome => farmacia.id})
      end
    end
    options_for_select(farmacias_hash, selected)
  end

end
