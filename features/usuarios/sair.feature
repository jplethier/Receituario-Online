Feature: Sign out
  To protect my account from unauthorized access
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      And I am a usuario with a cpf or cnpj "123" and senha "senha"
      When I sign in as "123/senha"
      Then I should be signed in
      And I sign out
      Then I should see "Fez logout com sucesso!"
      When I return next time
      Then I should be signed out
