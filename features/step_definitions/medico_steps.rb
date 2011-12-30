Given /^I am logged in as a medico with cpf "([^"]*)" and senha "([^"]*)"$/ do |cpf, senha|
  @current_user = FactoryGirl.create :medico
  @current_user.usuario = FactoryGirl.create :usuario, :cpf_cnpj => cpf, :senha => senha
  @current_user.save
  step %{I go to the sign in page}
  step %{I fill in "session_cpf_cnpj" with "#{@current_user.usuario.cpf_cnpj}"}
  step %{I fill in "session_senha" with "#{senha}"}
  step %{I press "Login"}
end