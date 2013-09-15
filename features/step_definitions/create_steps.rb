Then /^the user "(.*?)" should be created successfully$/ do |email_address|
  @user = User.where(:email => email_address)
  assert !@user.empty?
end

Then /^the user "(.*?)" should not be created successfully$/ do |email_address|
  @user = User.where(:email => email_address)
  assert @user.empty?
end

Then /^I create a user with the following information$/ do |fields|
  step %{I am on the "/" page}
  step %{I select "Create a new user"}
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
  step %{I click the "Register" button}    
end

