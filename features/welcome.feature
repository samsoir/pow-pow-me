Feature: Pow! Pow! Me Welcome Screen
  As a Pow! Pow! Me new customer
  In order to understand the product quickly
  I want to be able to use the app immediately from launch

  Background:
    Given I am currently located in "Chicago"

  Scenario: Launch app first
    When I launch the application
    Then I should see "Pow! Pow! Me"
    And I should see a map
    And I should see a "Pow! Pow! Me" button
    And I should see a "Me" button
    And I should see a "Help" button
    And I should see map search results
