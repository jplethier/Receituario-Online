Feature: Cadastrar Medico
  Uma clinica cadastrada e autenticada no sistema deve poder cadastrar
  Um médico para que ele possa acessar o sistema para atender os pacientes

    Scenario: Clinica cadastra medico com dados validos
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "user@test.com"
      And I fill in medico's cpf with "987"
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Conta criada com sucesso"

    Scenario: Clinica tenta cadastrar medico com um email inválido
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "emailinvalido"
      And I fill in medico's cpf with "1234"
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Clinica tenta cadastrar medico sem email
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with ""
      And I fill in medico's cpf with "1234"
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Clinica tenta cadastrar medico sem senha
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "a@a.com"
      And I fill in medico's cpf with "1234"
      And I fill in medico's senha with ""
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Clinica tenta cadastrar medico sem cpf
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "a@a.com"
      And I fill in medico's cpf with ""
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"

    Scenario: Clinica tenta cadastrar medico com cpf invalido
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "a@a.com"
      And I fill in medico's cpf with "aaa"
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with "crm"
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"
    
    Scenario: Clinica tenta cadastrar medico sem crm
      Given I am logged in as a clinica with cnpj "123" and senha "senha"
      And I follow "Cadastrar Médico"
      And I fill in medico's nome with "nome"
      And I fill in medico's email with "a@a.com"
      And I fill in medico's cpf with ""
      And I fill in medico's senha with "senha"
      And I fill in medico's crm with ""
      And I press "Confirmar"
      Then I should see "Erro ao criar a conta"