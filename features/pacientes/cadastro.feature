Feature: Cadastrar Paciente
  Um medico cadastrado e autenticado no sistema deve poder cadastrar
  Um paciente para que ele possa acessar o sistema para atender receitas

    Scenario: Farmacia cadastra paciente com dados validos
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with "user@test.com"
      And I fill in paciente's cpf with "987"
      And I fill in paciente's senha with "senha"
      And I press "Confirmar"
      Then I should see "Conta criada com sucesso"

    Scenario: Farmacia tenta cadastrar paciente com um email inválido
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with "emailinvalido"
      And I fill in paciente's cpf with "1234"
      And I fill in paciente's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar paciente sem email
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with ""
      And I fill in paciente's cpf with "1234"
      And I fill in paciente's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar paciente sem senha
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with "a@a.com"
      And I fill in paciente's cpf with "1234"
      And I fill in paciente's senha with ""
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar paciente sem cpf
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with "a@a.com"
      And I fill in paciente's cpf with ""
      And I fill in paciente's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar paciente com cpf invalido
      Given I am logged in as a medico with cpf "123" and senha "senha"
      And I follow "Cadastrar Paciente"
      And I fill in paciente's nome with "nome"
      And I fill in paciente's email with "a@a.com"
      And I fill in paciente's cpf with "aaa"
      And I fill in paciente's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"