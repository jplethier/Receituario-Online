#coding: utf-8
require 'spec_helper'

describe Medico do

  let(:medico) {Factory.build :medico}
  subject {medico}

  describe "Validações:" do

    it "deve ter crm" do
      medico.crm = ""
      medico.should_not be_valid
    end
    
  end

end
