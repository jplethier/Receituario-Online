#coding: utf-8
require 'spec_helper'

describe Receita do

  let(:receita) {Factory.build :receita}
  subject {receita}

  its(:save) { should be_true }

  it { should respond_to :medico }
  it { should respond_to :clinica }
  it { should respond_to :paciente }
  it { should respond_to :atendente }
  it { should respond_to :farmacia }


  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:atendente) }
    it { should allow_mass_assignment_of(:clinica) }
    it { should allow_mass_assignment_of(:paciente) }
    it { should allow_mass_assignment_of(:paciente_id) }
    it { should allow_mass_assignment_of(:medico) }
    it { should allow_mass_assignment_of(:dataAtendimento) }
    it { should allow_mass_assignment_of(:descricao) }
    it { should allow_mass_assignment_of(:farmacia) }
  end


  describe "Validações:" do

    describe "medico validações" do
      it "deve ter medico" do
        receita.medico = nil
        receita.should_not be_valid
      end

      it "receita deve estar vinculada a alguma clinica" do
        receita.clinica = nil
        receita.should_not be_valid
      end

    end
    
    it "deve ter paciente" do
      receita.paciente = nil
      receita.should_not be_valid
    end

    it "deve ter descricao" do
      receita.descricao = ""
      receita.should_not be_valid
    end
    
  end

end
