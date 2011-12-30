Feature: Cadastrar Balconista
  Uma farmacia cadastrada e autenticada no sistema deve poder cadastrar
  Um balconista para que ele possa acessar o sistema para atender receitas

    Scenario: Farmacia cadastra balconista com dados validos
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with "user@test.com"
      And I fill in balconista's cpf with "987"
      And I fill in balconista's senha with "senha"
      And I press "Confirmar"
      Then I should see "Conta criada com sucesso"

    Scenario: Farmacia tenta cadastrar balconista com um email inválido
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with "emailinvalido"
      And I fill in balconista's cpf with "1234"
      And I fill in balconista's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar balconista sem email
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with ""
      And I fill in balconista's cpf with "1234"
      And I fill in balconista's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar balconista sem senha
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with "a@a.com"
      And I fill in balconista's cpf with "1234"
      And I fill in balconista's senha with ""
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar balconista sem cpf
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with "a@a.com"
      And I fill in balconista's cpf with ""
      And I fill in balconista's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta cadastrar balconista com cpf invalido
      Given I am logged in as a farmacia with cnpj "123" and senha "senha"
      And I follow "Cadastrar Balconista"
      And I fill in balconista's nome with "nome"
      And I fill in balconista's email with "a@a.com"
      And I fill in balconista's cpf with "aaa"
      And I fill in balconista's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"