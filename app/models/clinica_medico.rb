class ClinicaMedico < ActiveRecord::Base
  belongs_to :clinica
  belongs_to :medico

  def self.por_medico_e_clinica(medico_id, clinica_id)
    where("clinicas_medicos.medico_id = ? and clinicas_medicos.clinica_id = ?", medico_id, clinica_id).first
  end

  def validar_medico_clinica_unicos
    clinica_medico = ClinicaMedico.por_medico_e_clinica(self.medico_id, self.clinica_id)
    return true if clinica_medico.nil?
    false
  end

  def self.por_clinica(clinica)
    where("clinicas_medicos.clinica_id = ?", clinica.id)
  end

end
  