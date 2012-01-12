# coding: UTF-8
module MedicosHelper

  def clinica_options(selected = nil)
    clinicas_hash = nil
    medico_corrente.clinicas.each do |clinica|
      if clinicas_hash.nil?
        clinicas_hash = {clinica.usuario.nome => clinica.id}
      else
        clinicas_hash.merge!({clinica.usuario.nome => clinica.id})
      end
    end
    options_for_select(clinicas_hash, selected)
  end

end
