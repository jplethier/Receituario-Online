class Usuario < ActiveRecord::Base

  validates :cpf_cnpj,  :presence => true, :uniqueness => true
  validates :email,     :presence => true, :uniqueness => true, :format => /^[a-z0-9A-Z.]+@[a-z0-9A-Z]+\.[a-z0-9A-Z]{1,3}(\.[a-z0-9A-Z]+)?$/
  validates :nome,      :presence => true
  validates :senha,     :presence => true

  attr_accessible :cpf_cnpj, :email, :nome, :senha
end
