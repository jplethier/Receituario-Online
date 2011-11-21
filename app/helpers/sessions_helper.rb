module SessionsHelper

  def sign_in(usuario)
    cookies.permanent.signed[:remember_token] = [usuario.id, usuario.email]
    @usuario_corrente = usuario
    puts @usuario_corrente
    debugger
    1
    @farmacia_corrente = Farmacia.por_usuario(usuario_corrente).first
    logger.debug(@farmacia_corrente)
    @clinica_corrente = Clinica.por_usuario(usuario_corrente).first
    @medico_corrente = Medico.por_usuario(usuario_corrente).first
    @paciente_corrente = Paciente.por_usuario(usuario_corrente).first
    @farmaceutico_corrente = Farmaceutico.por_usuario(usuario_corrente).first
    @balconista_corrente = Balconista.por_usuario(usuario_corrente).first
    @tipo_de_usuario = nil
  end

  def sign_out
    cookies.delete(:remember_token)
    self.usuario_corrente = nil
  end

  def usuario_corrente=(usuario)
    logger.debug(@usuario_corrente)	
    @usuario_corrente = usuario
  end

  def usuario_corrente
    @usuario_corrente ||= usuario_from_remember_token
    puts usuario_from_remember_token
    debugger
    1
    @usuario_corrente ||= usuario_from_remember_token
  end

  def logado?
    puts !usuario_corrente.nil?
    debugger
    1
    !usuario_corrente.nil?
  end

  def tipo_de_usuario
    if @tipo_de_usuario.nil?
      if Farmacia.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::FARMACIA
      elsif Clinica.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::CLINICA
      elsif Medico.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::MEDICO
      elsif Paciente.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::PACIENTE
      elsif Farmaceutico.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::FARMACEUTICO
      elsif Balconista.por_usuario(usuario_corrente)
        @tipo_de_usuario = Usuario::BALCONISTA
      else
        nil
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
