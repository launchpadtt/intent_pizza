Given /^I edit the profile with the following fields$/ do |table|
  step %{I select "Edit"}
  step "I fill in the following fields:", table
  step %{I click the "Update" button}
end

Then /^the user with the name "(.*?)" should be present$/ do |email|
  step %{the user "#{email}" should be created successfully}
end

Then /^the user with the name "(.*?)" should NOT be present$/ do |email|
  step %{the user "#{email}" should not be created successfully}
end
