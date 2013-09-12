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

