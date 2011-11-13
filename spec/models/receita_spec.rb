#coding: utf-8
require 'spec_helper'

describe Receita do

  let(:receita) {Factory.build :receita}
  subject {receita}

  describe "Validações:" do

    it "deve ter medico" do
      receita.medico = nil
      receita.should_not be_valid
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
