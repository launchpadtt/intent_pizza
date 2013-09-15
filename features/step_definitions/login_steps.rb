Given /^I created a valid user$/ do
    step %{I am on the "root" page}
    step %{I select "Create a new user"}
    step %{I fill in "Email" with "testuser@validdomain.com"}
    step %{I fill in "Password" with "testpassword"}
    step %{I fill in "Password confirmation" with "testpassword"}
    step %{I click the "Register" button}
end

Then /^I should see "(.*?)" after "(.*?)" on the page$/ do |second_text, first_text|
  assert page.body.match(/#{first_text}.*#{second_text}/m) != nil
end

Then /^I create a user with the following information$/ do |fields|
  step %{I am on the "/" page}
  step %{I select "Create a new user"}
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
  step %{I click the "Register" button}    
end

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

Then /^I log in a valid user$/ do
  
end