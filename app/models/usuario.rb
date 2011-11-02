require 'digest'
class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true, :format => /^[a-z0-9A-Z.]+@[a-z0-9A-Z]+\.[a-z0-9A-Z]{1,3}(\.[a-z0-9A-Z]+)?$/
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessible :cpf_cnpj, :email, :nome, :senha

  before_save :criptografar_senha

  scope :por_cpf_cnpj, :where => ("usuarios.cpf_cnpj = ?", cpf_cnpj)

  def self.authenticate(email, senha)
    usuario = find_by_email(email)
    return nil  if usuario.nil?
    return usuario if usuario.possui_senha?(senha)
  end

  def self.authenticate_com_email(id, cookie_email)
    usuario = find_by_id(id)
    (usuario && usuario.email == cookie_email) ? usuario : nil
  end

  def possui_senha?(senha)
    self.senha == criptografar_senha(senha)
  end

  private
    
    def criptografar_senha
      self.senha = Digest::SHA2.hexdigest(self.senha)
    end
    
end
