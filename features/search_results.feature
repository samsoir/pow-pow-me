@WIP
Feature: Search Results
  In order to see potential Pow! Pow! trips
  As a Pow! Pow! searching customer
  I want to be able to view detailed matched search results

  Background:
    Given my current location is "41.9732638","-876580603"

  @focus
  Scenario: Search for average priced long weekend
    When I search for a far away, average priced, long weekend on the mountain
    Then I should see 3 search results
    And I should see a "Surprise me!" button

  Scenario: Surprise me!
    When I am on the search results page
    And I touch the "Surprise me!" button
    Then a random trip should be selected
    And I should see the trip details

  Scenario: Trip details
    Given there are 3 matching trips
    When I am on the search results page
    And I touch list item number 1
    Then I should see the trip details
