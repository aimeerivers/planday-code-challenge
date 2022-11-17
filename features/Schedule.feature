Feature: Schedule

  Scenario: An employee views the schedule page
    Given an employee is logged in
    When they navigate to the schedule page
    Then they should see a schedule for the current week
    And there should be 3 employees displayed

  @create_shift
  Scenario: An employee creates a shift
    Given an employee is on the schedule page
    When they create a shift for "Employee One" from "09:00" to "17:00" today
    Then the shift is visible in the schedule grid
