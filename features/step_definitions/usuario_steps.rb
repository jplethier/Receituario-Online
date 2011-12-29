# coding: UTF-8

Given /^I am not logged in$/ do
  visit('/sessions/destroy') # ensure that at least
end

And /^no user exists with a cpf or cnpj of "([^"]*)"$/ do |value|
  Usuario.por_cpf_cnpj(value).should be_nil
end

When /^I sign in as "(.*)\/(.*)"$/ do |login, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in session's cpf_cnpj with "#{login}"}
  step %{I fill in session's senha with "#{password}"}
  step %{I press "Login"}
end

Then /^I should be signed out$/ do
  step %{I should see "Login"}
  step %{I should not see "Sair"}
end

Then /^I should be signed in$/ do
  step %{I should see "Usuário Logado"}
end

Given /^I am a usuario with a cpf or cnpj "([^"]*)" and senha "([^"]*)"$/ do |cpf_cnpj, senha|
  @current_user = FactoryGirl.create :usuario, :cpf_cnpj => cpf_cnpj, :senha => senha

  step %{I go to the sign in page}
  step %{I fill in "session_cpf_cnpj" with "#{@current_user.cpf_cnpj}"}
  step %{I fill in "session_senha" with "#{@current_user.senha}"}
  step %{I press "Login"}
end

And /^I sign out$/ do
  step %{I follow "Sair"}
end

When /^I return next time$/ do
  step %{I go to the home page}
end