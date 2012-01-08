# coding: UTF-8
module MedicosHelper

  def clinica_options(selected = nil)
    clinicas_hash = nil
    medico_corrente.clinicas.each do |clinica|
      if clinicas_hash.nil?
        clinicas_hash = {clinica.usuario.nome => clinica.id}
      else
        hash_of_states.merge!({clinica => clinica.id})
      end
    end
    options_for_select(clinicas_hash, clinica_corrente.id)
  end

end
