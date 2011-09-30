#coding: utf-8
require 'spec_helper'

describe Usuario do

  let(:user) {Factory.build :user}
  subject {usuario}

  describe "Validações:" do

    it "deve ter email" do
      user.email = ""
      user.should_not be_valid
    end

    it "deve ter cpf ou cnpj" do
      user.cpf_cnpj = ""
      user.should_not be_valid
    end

    it "deve ter nome" do
      user.nome = ""
      user.should_not be_valid
    end

    it "deve ter senha" do
      user.senha = ""
      user.should_not be_valid
    end

    it "o email deve estar no formato correto" do
      user.email = "joaozinho.com"
    end
  end
end
