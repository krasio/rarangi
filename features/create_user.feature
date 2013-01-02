Feature: Create user

  Scenario: Create new user
    Given there is user named "krasio"
    Then "krasio" should exists
    And "krasio" should have a list
