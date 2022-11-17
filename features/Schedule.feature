Feature: Schedule

  Scenario: An employee views the schedule page
    Given an employee is logged in
    When they navigate to the schedule page
    Then they should see a schedule for the current week
    And there should be 3 employees displayed
