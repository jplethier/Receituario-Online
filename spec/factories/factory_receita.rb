#coding: utf-8

FactoryGirl.define do
  factory :receita do
    descricao "Factory Receita Descrição"
    medico
    paciente
    clinica
  end
end
