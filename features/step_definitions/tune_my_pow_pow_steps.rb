Given(/^I am on the "(.*?)" screen$/) do |arg1|
  steps %Q{
    Given I am on the welcome screen
    When I touch the "Pow! Pow! Me" button
    Then I should see "Tune My Pow! Pow!"
  }
end

Then(/^I should see the searching interstitial$/) do
  steps %Q{
    Then I should see "Shredding Pow! Pow!"
  }
end
