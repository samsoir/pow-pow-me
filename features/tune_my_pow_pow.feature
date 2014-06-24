Feature: Tune My Pow! Pow!
  In order to get the exact holiday I want
  As a Pow! Pow! Me customer
  I want to be able to set search paramters before searching

  Scenario: Tune My Pow! Pow!
    Given I am on the welcome screen
    When I touch the "Pow! Pow! Me" button
    Then I should see "Tune My Pow! Pow!"
  
  @focus
  Scenario: Perform tuned search
    Given I am on the "Tune My Pow! Pow!" screen
    When I touch "average price range"
    And I touch "five or more hours travel time"
    And I touch "long weekend on the mountain"
    And I touch the "Lets Go!" button
    Then I should see "Shredding Pow! Pow!"
