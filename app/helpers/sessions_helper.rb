module SessionsHelper

  def sign_in(usuario)
    cookies.permanent.signed[:remember_token] = [usuario.id, usuario.email]

    self.usuario_corrente = usuario
    self.farmacia_corrente = Farmacia.por_usuario(usuario_corrente).first
    self.clinica_corrente = Clinica.por_usuario(usuario_corrente).first
    self.medico_corrente = Medico.por_usuario(usuario_corrente).first
    self.paciente_corrente = Paciente.por_usuario(usuario_corrente).first
    self.farmaceutico_corrente = Farmaceutico.por_usuario(usuario_corrente).first
    self.balconista_corrente = Balconista.por_usuario(usuario_corrente).first

    @tipo_de_usuario = nil
  end

  def sign_out
    cookies.delete(:remember_token)
    self.usuario_corrente = nil
    @tipo_de_usuario = nil
  end

  def usuario_corrente=(usuario)
    logger.debug(@usuario_corrente)	
    @usuario_corrente = usuario
  end

  def farmacia_corrente=(farmacia)
    @farmacia_corrente = farmacia
  end

  def clinica_corrente=(clinica)
    @clinica_corrente = clinica
  end

  def medico_corrente=(medico)
    @medico_corrente = medico
  end

  def paciente_corrente=(paciente)
    @paciente_corrente = paciente
  end

  def farmaceutico_corrente=(farmaceutico)
    @farmaceutico_corrente = farmaceutico
  end

  def balconista_corrente=(balconista)
    @balconista_corrente = balconista
  end

  def usuario_corrente
    @usuario_corrente ||= usuario_from_remember_token
  end

  def farmacia_corrente
    @farmacia_corrente ||= Farmacia.por_usuario(usuario_from_remember_token).first
    if @farmacia_corrente.nil?
      @farmacia_corrente = farmaceutico_corrente.farmacias.first if farmaceutico_corrente
      @farmacia_corrente = balconista_corrente.farmacias.first if balconista_corrente
    end
    @farmacia_corrente
  end

  def clinica_corrente
    @clinica_corrente ||= Clinica.por_usuario(usuario_from_remember_token).first
    if @clinica_corrente.nil? && medico_corrente
      @clinica_corrente = medico_corrente.clinicas.first
    end
    @clinica_corrente
  end

  def medico_corrente
    @medico_corrente ||= Medico.por_usuario(usuario_from_remember_token).first
  end

  def paciente_corrente
    @paciente_corrente ||= Paciente.por_usuario(usuario_from_remember_token).first
  end

  def farmaceutico_corrente
    @farmaceutico_corrente ||= Farmaceutico.por_usuario(usuario_from_remember_token).first
  end

  def balconista_corrente
    @balconista_corrente ||= Balconista.por_usuario(usuario_from_remember_token).first
  end

  def logado?
    !usuario_corrente.nil?
  end

  def tipo_de_usuario
    if @tipo_de_usuario.nil?
      if paciente_corrente
        @tipo_de_usuario = Usuario::PACIENTE
      elsif medico_corrente
        @tipo_de_usuario = Usuario::MEDICO
      elsif clinica_corrente
        @tipo_de_usuario = Usuario::CLINICA
      elsif balconista_corrente
        @tipo_de_usuario = Usuario::BALCONISTA
      elsif farmaceutico_corrente
        @tipo_de_usuario = Usuario::FARMACEUTICO
      elsif farmacia_corrente
        @tipo_de_usuario = Usuario::FARMACIA
      else
        puts "-"*100
        puts "ERRO NO TIPO DE USUARIO"
        puts "-"*100
      end
    end
    @tipo_de_usuario
  end

  private
    
    def usuario_from_remember_token
      Usuario.authenticate_com_email(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
