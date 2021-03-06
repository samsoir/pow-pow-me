Feature: Pow! Pow! Me Welcome Screen
  In order to understand the product quickly
  As a Pow! Pow! Me new customer
  I want to be able to use the app immediately from launch

  Background:
    Given my current location is "41.9732638","-87.6580603"

  Scenario: Launch app first
    When I launch the application
    Then I should see "Pow! Pow! Me"
    And I should see a map
    And I should see a "Pow! Pow! Me" button
    And I should see a "Me" button
    And I should see a "Help" button
    And I should see map search results

  Scenario: Test example
    When I put the application to sleep
    Then my state should be saved
    And 