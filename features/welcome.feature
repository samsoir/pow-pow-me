Feature: Pow! Pow! Me Welcome Screen
  As a Pow! Pow! Me new customer
  In order to understand the product quickly
  I want to be able to use the app immediately from launch

  Background:
    Given I am currently located in "Chicago"

  Scenario: Launch app first
    When I launch the application
    Then I should see "Pow! Pow! Me"
