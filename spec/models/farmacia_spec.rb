#coding: utf-8
require 'spec_helper'

describe Farmacia do
  
  let(:farmacia) {Factory.build :farmacia}
  subject {farmacia}

  its(:save) { should be_true }

  it { should respond_to :usuario }
  it { should respond_to :receitas }
  it { should respond_to :balconistas }
  it { should respond_to :farmaceuticos }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:endereco) }
    it { should allow_mass_assignment_of(:usuario_attributes) }
  end

  describe "Validações" do

    it "endereço deve ser obrigatório" do
      farmacia.endereco = ""
      farmacia.should_not be_valid
    end
    
  end

end
