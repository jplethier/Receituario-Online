require 'digest'
class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true, :format => /^[a-z0-9A-Z.]+@[a-z0-9A-Z]+\.[a-z0-9A-Z]{1,3}(\.[a-z0-9A-Z]+)?$/
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessible :cpf_cnpj, :email, :nome, :senha

  before_save :criptografar_senha

  def self.por_cpf_cnpj(cpf_cnpj)
    where("usuarios.cpf_cnpj = ?", cpf_cnpj)
  end

  def criptografar(senha)
    Digest::SHA2.hexdigest(senha)
  end

  def self.authenticate(cpf_cnpj, senha)
    usuario = por_cpf_cnpj(cpf_cnpj).first
    return nil  if usuario.nil?
    #TODO: fazer funcionar a chamada para outro método dentro da classe
    #return usuario if usuario.senha = criptografar(senha)
    return usuario if usuario.senha = Digest::SHA2.hexdigest(senha)
  end

  def self.authenticate_com_email(id, cookie_email)
    usuario = find_by_id(id)
    (usuario && usuario.email == cookie_email) ? usuario : nil
  end

  private
    
    def criptografar_senha
      #TODO: fazer funcionar a chamada para outro método dentro da classe
      #self.senha = criptografar(self.senha)
      self.senha = Digest::SHA2.hexdigest(self.senha)
    end
    
end
