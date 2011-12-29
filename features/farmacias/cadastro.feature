Feature: Cadastrar Farmacia
  Para acessar as funcionalidades de Farmacia no site
  Uma Farmacia precisa poder se cadastrar

    Scenario: Farmacia se cadastra com dados válidos
      Given I am not logged in
      When I go to the new farmacia page
      And I fill in farmacia's nome with "nome"
      And I fill in farmacia's email with "user@test.com"
      And I fill in farmacia's cnpj with "123"
      And I fill in farmacia's senha with "senha"
      And I fill in farmacia's endereco with "endereco"
      And I press "Confirmar"
      Then I should see "Conta criada com sucesso"

    Scenario: Farmacia tenta se cadastrar com um email inválido
      Given I am not logged in
      When I go to the new farmacia page
      And I fill in farmacia's nome with "nome"
      And I fill in farmacia's email with "invalidemail"
      And I fill in farmacia's cnpj with "123"
      And I fill in farmacia's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta se cadastrar sem email
      Given I am not logged in
      When I go to the new farmacia page
      And I fill in farmacia's nome with "nome"
      And I fill in farmacia's email with ""
      And I fill in farmacia's cnpj with "123"
      And I fill in farmacia's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta se cadastrar sem senha
      Given I am not logged in
      When I go to the new farmacia page
      And I fill in farmacia's nome with "nome"
      And I fill in farmacia's email with "user@test.com"
      And I fill in farmacia's cnpj with "123"
      And I fill in farmacia's senha with ""
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Farmacia tenta se cadastrar sem cnpj
      Given I am not logged in
      When I go to the new farmacia page
      And I fill in farmacia's nome with "nome"
      And I fill in farmacia's email with "user@test.com"
      And I fill in farmacia's cnpj with ""
      And I fill in farmacia's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"