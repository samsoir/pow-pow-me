When(/^I launch the application$/) do
  # no op
end

Given(/^I am on the welcome screen$/) do
  steps %Q{
    Then I should see "Pow! Pow! Me"
  }
end
