Feature: Authentication

  Scenario: A user cannot log in with invalid credentials
    Given a user visits the login form
    When they try to log in with invalid credentials
    Then they should not be able to log in

  Scenario: An employee is able to log in
    Given an employee visits the login form
    When they try to log in with valid credentials
    Then they are logged in successfully
