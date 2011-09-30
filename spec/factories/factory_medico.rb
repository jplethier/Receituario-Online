#coding: utf-8
require "factory_girl"

FactoryGirl.define do
  factory :medico do
    user
    sequence(:crm) {|n| "#{n}"}
  end
end
