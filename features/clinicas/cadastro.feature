Feature: Cadastrar Clinica
  Para acessar as funcionalidades de clinica no site
  Uma clinica precisa poder se cadastrar

    Scenario: Clinica se cadastra com dados válidos
      Given I am not logged in
      When I go to the new clinica page
      And I fill in clinica's nome with "nome"
      And I fill in clinica's email with "user@test.com"
      And I fill in clinica's cnpj with "123"
      And I fill in clinica's senha with "senha"
      And I fill in clinica's endereco with "endereco"
      And I press "Confirmar"
      Then I should see "Conta criada com sucesso"

    Scenario: Clinica tenta se cadastrar com um email inválido
      Given I am not logged in
      When I go to the new clinica page
      And I fill in clinica's nome with "nome"
      And I fill in clinica's email with "invalidemail"
      And I fill in clinica's cnpj with "123"
      And I fill in clinica's senha with "senha"
      And I press "Confirmar"
      Then I should see "Erro ao criar conta"

    Scenario: Clinica tenta se cadastrar sem email
      Given I am not logged in
      When I go to the new clinica page
      And I fill in clinica's nome with "nome"
      And I fill in clinica's email with ""
      And I fill in clinica's cnpj with "123"
      And I fill in clinica's senha with "senha"
      And I press "Confirmar"
      Then I should see "*Não pode ficar em branco"

    Scenario: Clinica tenta se cadastrar sem senha
      Given I am not logged in
      When I go to the new clinica page
      And I fill in clinica's nome with "nome"
      And I fill in clinica's email with "user@test.com"
      And I fill in clinica's cnpj with "123"
      And I fill in clinica's senha with ""
      And I press "Confirmar"
      Then I should see "*Não pode ficar em branco"

    Scenario: Clinica tenta se cadastrar sem cnpj
      Given I am not logged in
      When I go to the new clinica page
      And I fill in clinica's nome with "nome"
      And I fill in clinica's email with "user@test.com"
      And I fill in clinica's cnpj with ""
      And I fill in clinica's senha with "senha"
      And I press "Confirmar"
      Then I should see "*Não pode ficar em branco"