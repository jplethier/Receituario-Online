class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessible :cpf_cnpj, :email, :nome, :senha
end
