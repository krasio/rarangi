Feature: Mark entry as completed

  Scenario: Mark entry as completed
    Given I'm a new user
    And "olive oil" is in my list
    When I mark "olive oil" as completed
    And "olive oil" should be listed as completed
