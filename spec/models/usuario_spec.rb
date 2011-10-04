#coding: utf-8
require 'spec_helper'

describe Usuario do

  let(:usuario) {Factory.build :usuario}
  subject {usuario}

  describe "Validações:" do

    it "deve ter email" do
      usuario.email = ""
      usuario.should_not be_valid
    end

    it "deve ter cpf ou cnpj" do
      usuario.cpf_cnpj = ""
      usuario.should_not be_valid
    end

    it "deve ter nome" do
      usuario.nome = ""
      usuario.should_not be_valid
    end

    it "deve ter senha" do
      usuario.senha = ""
      usuario.should_not be_valid
    end

    it "o email deve estar no formato correto" do
      usuario.email = "joaozinho.com"
    end
  end
end
