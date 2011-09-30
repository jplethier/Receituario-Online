#coding: utf-8
require "factory_girl"

FactoryGirl.define do
  factory :receita do
    descricao "Factory Receita Descrição"
    medico
    paciente
  end
end
