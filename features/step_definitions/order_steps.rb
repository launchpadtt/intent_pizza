Given /^I order a pizza with the following information$/ do |fields|
  step %{I select "Order a pizza"}
  step %{I complete the pizza order}, fields
end

Given /^I place another order for a pizza with the following information$/ do |fields|
  step %{I select "Place another order"}
  step %{I complete the pizza order}, fields
end

Given /^I complete the pizza order$/ do |fields|
  step %{I fill out the following pizza information}, fields
  step %{I order the pizza}
end

Given /^I create an unordered pizza with the following information$/ do |fields|
  step %{I select "Order a pizza"}
  step %{I fill out the following pizza information}, fields
end

Given /^I fill out the following pizza information$/ do |fields|
  step %{I start to order a pizza with the following information}, fields
  step %{The unordered pizza should be created}, fields
end

Given /^I start to order a pizza with the following information$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
  step %{I click the "Create" button}
end

Then /^The unordered pizza should be created$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I should see "#{name}: #{value}" on the page}
  end
  #<td>#{pizza_name}<\/td>\s*<td>#{pizza_size}<\/td>\s*<td>#{toppings_no}<\/td>\s*<td>#{ordered}
end

Then /^I order the pizza$/ do
  step %{I select "Order this pizza"}
end

Then /^the pizza named "(.*?)" with the size of "(.*?)", "(.*?)" toppings ordered and ordered status of "(.*?)" should have been ordered$/ do |pizza_name, pizza_size, toppings_no, ordered|
  assert page.body.match(/Name.*Size.*Number of toppings.*Order placed?/m)
  assert page.body.match(/#{pizza_name}.*#{pizza_size}.*#{toppings_no}.*#{ordered}/m)
end

Then /^the pizza named "(.*?)" with the size of "(.*?)", "(.*?)" toppings ordered and ordered status of "(.*?)" should NOT have been ordered$/ do |pizza_name, pizza_size, toppings_no, ordered|
  assert page.body.match(/Name.*Size.*Number of toppings.*Order placed?/m)
  assert !page.body.match(/#{pizza_name}.*#{pizza_size}.*#{toppings_no}.*#{ordered}/m)
end

Then /^I should NOT see two pizzas named "(.*?)" with a size of "(.*?)", "(.*?)" toppings ordered and ordered status of "(.*?)"$/ do |pizza_name, pizza_size, toppings_no, ordered|
  assert page.body.scan(/<td>#{pizza_name}<\/td>\s*<td>#{pizza_size}<\/td>\s*<td>#{toppings_no}<\/td>\s*<td>#{ordered}/m).count == 1
end
