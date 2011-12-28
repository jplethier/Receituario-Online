Feature: Sign out
  To protect my account from unauthorized access
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      Given I am a user with an email "user@email.com" and password "password"
      When I sign in as "user@email.com/password"
      Then I should be signed in
      And I sign out
      Then I should see "Fez logout com sucesso."
      When I return next time
      Then I should be signed out
