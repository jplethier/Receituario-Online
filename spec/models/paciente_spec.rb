#coding: utf-8
require 'spec_helper'

describe Paciente do

  let(:paciente) {Factory.build :paciente}
  subject {paciente}

  its(:save) { should be_true }

  it { should respond_to :usuario }
  it { should respond_to :receitas }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:usuario_attributes) }
  end
  
end
