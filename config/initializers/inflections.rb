# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'receita', 'receitas'
   inflect.irregular 'farmacia', 'farmacias'
   inflect.irregular 'clinica_medico', 'clinicas_medicos'
   inflect.irregular 'balconista', 'balconistas'
   inflect.irregular 'balconista_farmacia', 'balconistas_farmacias'
   inflect.irregular 'farmacia_farmaceutico', 'farmacias_farmaceuticos'
#   inflect.uncountable %w( fish sheep )
 end
