#coding: utf-8

FactoryGirl.define do
  factory :medico do
    usuario
    sequence(:crm) {|n| "#{n}"}
    clinicas {|clinicas| [clinicas.association(:clinica)]}
  end
end
