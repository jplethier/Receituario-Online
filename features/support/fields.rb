module Fields

  def get_field(klass, field)
    case klass
    when "clinica"
      field_id = Fields::CLINICA[field]
    when "usuario"
      field_id = Fields::USUARIO[field]
    when "farmacia"
      field_id = Fields::FARMACIA[field]
    when "paciente"
      field_id = Fields::PACIENTE[field]
    when "farmaceutico"
      field_id = Fields::FARMACEUTICO[field]
    when "balconista"
      field_id = Fields::BALCONISTA[field]
    when "receita"
      field_id = Fields::RECEITA[field]
    when "medico"
      field_id = Fields::MEDICO[field]
    when "session"
      field_id = Fields::SESSION[field]
    end

    field_id ? field_id : "#{field} not found on #{__FILE__}"
  end

  CLINICA = {
    "nome" => "clinica_usuario_attributes_nome",
    "email" => "clinica_usuario_attributes_email",
    "cnpj" => "clinica_usuario_attributes_cpf_cnpj",
    "senha" => "clinica_usuario_attributes_senha",
    "endereco" => "clinica_endereco"
  }

  USUARIO = {
    "cpf_cnpj" => "usuario_cpf_cnpj",
    "senha" => "usuario_senha"
  }

  FARMACIA = {
    "nome" => "farmacia_usuario_attributes_nome",
    "email" => "farmacia_usuario_attributes_email",
    "cnpj" => "farmacia_usuario_attributes_cpf_cnpj",
    "senha" => "farmacia_usuario_attributes_senha",
    "endereco" => "farmacia_endereco"
  }

  PACIENTE = {
    
  }

  FARMACEUTICO = {
    
  }

  BALCONISTA = {
    
  }

  RECEITA = {
    
  }

  MEDICO = {
    
  }

  SESSION = {
    "cpf_cnpj" => "session_cpf_cnpj",
    "senha" => "session_senha" 
  }

end

World(Fields)
