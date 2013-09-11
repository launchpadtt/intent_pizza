Given /^I am on the "(.*?)" page$/ do |page_name|
  visit page_name
end

When /^I select "(.*?)"$/ do |link|
  click_link(link)
end

Then /^I should be on the "(.*?)" page$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I fill in the following fields:$/ do |table|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end
