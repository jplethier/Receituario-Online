require 'digest'
class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true, :format => /^[a-z0-9A-Z.]+@[a-z0-9A-Z]+\.[a-z0-9A-Z]{1,3}(\.[a-z0-9A-Z]+)?$/
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessor :senha

  attr_accessible :cpf_cnpj, :email, :nome, :senha

  before_save :criptografar_senha

  def self.por_cpf_cnpj(cpf_cnpj)
    where("usuarios.cpf_cnpj = ?", cpf_cnpj)
  end

  def self.authenticate(email, senha)
    usuario = por_cpf_cnpj(email)
    return nil  if usuario.nil?
    return usuario if usuario.possui_senha?(senha)
  end

  def self.authenticate_com_email(id, cookie_email)
    usuario = find_by_id(id)
    (usuario && usuario.email == cookie_email) ? usuario : nil
  end

  def self.possui_senha?(senha)
    debugger
    1
    self.senha == criptografar(senha)
  end

  def criptografar(senha)
    Digest::SHA2.hexdigest(senha)
  end

  private
    
    def criptografar_senha
      self.senha = criptografar(self.senha)
    end
    
end
