Then /^I login with the following information:$/ do |fields|
  step %{I am on the "/" page}
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
  step %{I click the "Login" button}  
end

Then /^I should be logged in with the user "(.*?)"$/ do |arg1|
  step %{I should be on the "account" page}
  step %{I should see "testuser@validdomain.com" on the page}
end

Then /^I log(ged)? in (with )?(a|the) valid user$/ do |arg1,arg2,arg3|
  step "I login with the following information:", table(%{
    | Email                 | testuser@validdomain.com |
    | Password              | testpassword             |
  })
end

Given /^(I )?(L|l)ogin with a different user after having already logged in$/ do |arg1, arg2|
  step "I create a user with the following information", table(%{
    | Email                 | secondtestuser@validdomain.com |
    | Password              | secondtestpassword             |
    | Password confirmation | secondtestpassword             |})
  step "I login with the following information:", table(%{
    | Email    | testuser@validdomain.com |
    | Password | testpassword             |})
  #step %{I should be logged in with the user "secondtestuser@validdomain.com"}
end