#coding: utf-8
require 'spec_helper'

describe Farmacia do
  
  let(:farmacia) {Factory.build :farmacia}
  subject {farmacia}

  describe "Validações" do

    it "endereço deve ser obrigatório" do
      farmacia.endereco = ""
      farmacia.should_not be_valid
    end
    
  end

end
