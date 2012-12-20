Feature: Lists
  Scenario: New list
    Given there is a new list
    Then the list should be empty

  Scenario: Add entry to list
    Given there is a new list
    When one entry is pushed to the list
    Then the list should not be empty
    And the list should have size of 1
