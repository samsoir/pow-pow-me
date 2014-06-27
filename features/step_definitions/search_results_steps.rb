When(/^I search for a far away, average priced, long weekend on the mountain$/) do
  steps %Q{
    Given I am on the "Tune My Pow! Pow!" screen
    When I touch "average price range"
    And I touch "five or more hours travel time"
    And I touch "long weekend on the mountain"
    And I touch the "Lets Go!" button
    Then I should see the searching interstitial
    And I wait to see a navigation bar titled "Pow! Pow! Me"
  }
end

Then(/^I should see (\d+) search results$/) do |arg1|
  raise("Failed to find #{arg1} search results") unless query("tableView", numberOfRowsInSection:0) == [ arg1.to_i ]
end
