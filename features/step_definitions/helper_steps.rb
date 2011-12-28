When /^I fill in (.*)'s (.*) with "(.*)"$/ do |klass_name, field_name, value|
  field = get_field(klass_name, field_name)
  fill_in(field, :with => value)
end