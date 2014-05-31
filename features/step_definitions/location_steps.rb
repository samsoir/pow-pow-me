Given(/^my current location is "(.*?)","(.*?)"$/) do |arg1, arg2|
  set_location(:latitude => arg1.to_f, :longitude => arg2.to_f)
end

Then(/^I should see map search results$/) do
  element_exists("view:'mkannotationview'")
end
