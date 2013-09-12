Given /^I am on the "(.*?)" page$/ do |page_name|
  visit page_name
end

When /^I select "(.*?)"$/ do |link|
  click_link(link)
end

Then /^I should see "(.*?)" on the page$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should be on the "(.*?)" page$/ do |page_name|
  current_path = URI.parse(current_url).path.sub(/^\//, '')
  if current_path.respond_to? :should
    current_path.should == page_name
  else
    assert_equal page_name, current_path
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I fill in the following fields:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
end

Then /^I click the "(.*?)" button$/ do |button|
  click_button(button)
end

Then /^the user "(.*?)" should be created successfully$/ do |email_address|
  @user = User.where(:email => email_address)
  assert !@user.empty?
end

Then /^the user "(.*?)" should not be created successfully$/ do |email_address|
  @user = User.where(:email => email_address)
  assert @user.empty?
end
