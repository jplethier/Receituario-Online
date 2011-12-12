#coding: utf-8
require 'spec_helper'

describe Balconista do

  let(:balconista) {Factory.build :balconista}
  subject {balconista}

  its(:save) { should be_true }

  it { should respond_to :usuario }
  it { should respond_to :receitas }
  it { should respond_to :farmacias }

  describe "Acessibilidade" do
    it { should allow_mass_assignment_of(:usuario_attributes) }
  end
  
end
