module SessionsHelper

  def sign_in(usuario)
    cookies.permanent.signed[:remember_token] = [usuario.id, usuario.email]
    self.usuario_corrente = usuario
  end

  def sign_out
    cookies.delete(:remember_token)
    self.usuario_corrente = nil
  end

  def usuario_corrente=(usuario)
    @usuario_corrente = usuario
  end

  def usuario_corrente
    @usuario_corrente ||= usuario_from_remember_token
  end

  def logado?
    !usuario_corrente.nil?
  end

  private
    
    def usuario_from_remember_token
      Usuario.authenticate_com_email(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
