#coding: utf-8

FactoryGirl.define do
  factory :usuario  do
    nome "factory_usuario"
    sequence(:email) {|n| "factory#{n}@gmail.com"}
    senha "factory_password"
    sequence(:cpf_cnpj) {|n| "1000000#{n}"}
  end
end
