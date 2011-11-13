#coding: utf-8
require 'spec_helper'

describe Clinica do
  

  let(:clinica) {Factory.build :clinica}
  subject {clinica}

  describe "Validações" do

    it "endereço deve ser obrigatório" do
      clinica.endereco = ""
      clinica.should_not be_valid
    end
    
  end

end
