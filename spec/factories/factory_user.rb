#coding: utf-8
require "factory_girl"

FactoryGirl.define do
  factory :user  do
    nome "factory_user"
    sequence(:email) {|n| "factory#{n}@gmail..com"}
    senha "factory_password"
    sequence(:cpf_cnpj) {|n| "1000000#{n}"}
  end
end
