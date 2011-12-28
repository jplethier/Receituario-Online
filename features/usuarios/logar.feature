Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with a cpf or cnpj of "123"
      When I sign in as "123/senha"
      Then I should see "Dados inválidos."
      And I should be signed out

    Scenario: User enters wrong password
      Given I am not logged in
      And I am a user with a cpf ou cnpj "123" and senha "senha"
      When I sign in as "user@email.com/wrongpassword"
      Then I should see "Dados inválidos."
      And I should be signed out