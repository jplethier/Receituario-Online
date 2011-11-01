class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true, :format => /^[a-z0-9A-Z.]+@[a-z0-9A-Z]+\.[a-z0-9A-Z]{1,3}(\.[a-z0-9A-Z]+)?$/
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessible :cpf_cnpj, :email, :nome, :senha

  before_save :criptografar_senha

  scope :por_cpf_cnpj, :where => ("usuarios.cpf_cnpj = ?", cpf_cnpj)

  def authenticate(usuario)
    usuario1 = self.por_cpf_cnpj(usuario.cpf_cnpj)
    if usuario1
      usuario1.senha == usuario.senha
    else
      false
    end
  end

  private
    
    def criptografar_senha
      self.senha = Hash(self.senha)
    end
    
end
