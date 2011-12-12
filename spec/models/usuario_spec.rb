#coding: utf-8
require 'spec_helper'

describe Usuario do

  let(:usuario) {Factory.build :usuario}
  subject {usuario}

  its(:save) { should be_true }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:cpf_cnpj) }
    it { should allow_mass_assignment_of(:nome) }
    it { should allow_mass_assignment_of(:senha) }
    it { should allow_mass_assignment_of(:email) }
  end

  describe "Validações:" do

    it "cpf ou cnpj deve ser obrigatório" do
      usuario.cpf_cnpj = ""
      usuario.should_not be_valid
    end

    it "cpf ou cnpj devem ser numéricos" do
      usuario.cpf_cnpj = "a"
      usuario.should_not be_valid
    end

    it "nome deve ser obrigatório" do
      usuario.nome = ""
      usuario.should_not be_valid
    end

    it "senha deve ser obrigatória" do
      usuario.senha = ""
      usuario.should_not be_valid
    end

    describe "email" do

      it "email deve ser obrigatório" do
        usuario.email = ""
        usuario.should_not be_valid
      end

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
