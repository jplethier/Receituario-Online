Feature: Logar
  Para ter acesso as funcionalidades do sistema
  O usuário
  deve conseguir logar com sucesso

    Scenario: Usuário não está cadastrado
      Given I am not logged in
      And no user exists with a cpf or cnpj of "123"
      When I sign in as "123/senha"
      Then I should see "Usuário não cadastrado ou senha errada."
      And I should be signed out

    Scenario: Usuário tenta logar com senha errada
      Given I am not logged in
      And I am a usuario with a cpf or cnpj "123" and senha "senha"
      When I sign in as "123/senhaerrada"
      Then I should see "Usuário não cadastrado ou senha errada."
      And I should be signed out