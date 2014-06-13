Feature: Tune My Pow! Pow!
  In order to get the exact holiday I want
  As a Pow! Pow! Me customer
  I want to be able to set search paramters before searching

  @focus
  Scenario: Tune My Pow! Pow!
    Given I am on the welcome screen
    When I touch the "Pow! Pow! Me" button
    Then I should see "Tune My Pow! Pow!"

  Scenario: Perform tuned search
    Given I am on the "Tune My Pow! Pow!" screen
    When I touch the "average price range" button
    And I touch the "five or more hours travel time" button
    And I touch the "long weekend on the mountain" button
    And I touch the "Lets Go!" button
    Then I should see "Shredding Pow! Pow!"
