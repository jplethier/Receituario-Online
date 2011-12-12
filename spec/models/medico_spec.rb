#coding: utf-8
require 'spec_helper'

describe Medico do

  let(:medico) {Factory.build :medico}
  subject {medico}

  its(:save) { should be_true }

  it { should respond_to :usuario }
  it { should respond_to :receitas }
  it { should respond_to :clinicas }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:usuario_attributes) }
  end

  describe "Validações:" do

    it "crm deve ser obrigatório" do
      medico.crm = ""
      medico.should_not be_valid
    end
    
  end

end
