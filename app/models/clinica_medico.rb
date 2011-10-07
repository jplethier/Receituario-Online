class ClinicaMedico < ActiveRecord::Base
  belongs_to :clinica
  belongs_to :medico
end
  