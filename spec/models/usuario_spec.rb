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

    describe "email" do
      it "o email joaozinho.com deve ser inválido" do
        usuario.email = "joaozinho.com"
        usuario.should_not be_valid
      end

      it "o email a@.com deve ser inválido" do
        usuario.email = "a@.com"
        usuario.should_not be_valid
      end

      it "o email a@.com deve ser inválido" do
        usuario.email = "@com"
        usuario.should_not be_valid
      end

      it "o email a@a.com deve válido" do
        usuario.email = "a@a.com"
        usuario.should be_valid
      end

      it "o email a@a.com.br deve válido" do
        usuario.email = "a@a.com.br"
        usuario.should be_valid
      end
    end
  end
end
