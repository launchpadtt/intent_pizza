Given /^I select the "(.*?)" Link for the valid pizza$/ do |link|
  within(:xpath, "//tr/td[position() = 1 and text() = 'Pizza Unordered']/..") do
    click_link(link)
  end
end

When /^I select the Remove link for the "(.*?)" topping$/ do |topping|
  within(:xpath, "//tr/td[position() = 1 and text() = '#{topping}']/..") do
    click_link("Remove")
  end
end

Then /^the topping named "(.*?)" should be NOT be on the page$/ do |topping|
  assert !page.has_content?(topping)
end

Then /^there should NOT be Show and Edit links for the pizza$/ do
  assert !page.body.match(/<td>Pizza 1<\/td>\s*<td>30 inches<\/td>\s*<td>0<\/td>\s*<td>true\s*<td><a href=".*">.*Show<\/a><\/td>\s*<td><a href=".*">.*Edit<\/a><\/td>\s*<td><a href=".*">.*Remove<\/a><\/td>/m)
end
