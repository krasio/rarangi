Feature: Create entry

  Scenario: Add entry to list
    Given I'm a new user
    When I add "olive oil" to my list
    Then the list should not be empty
    And the list should have size of 1
    And "olive oil" should be listed
