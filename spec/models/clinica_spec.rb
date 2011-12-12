#coding: utf-8
require 'spec_helper'

describe Clinica do
  

  let(:clinica) {Factory.build :clinica}
  subject {clinica}

  its(:save) { should be_true }

  it { should respond_to :receitas }
  it { should respond_to :medicos }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:endereco) }
    it { should allow_mass_assignment_of(:usuario_attributes) }
  end

  describe "Validações" do

    it "endereço deve ser obrigatório" do
      clinica.endereco = ""
      clinica.should_not be_valid
    end
    
  end

end
