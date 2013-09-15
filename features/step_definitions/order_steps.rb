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
end

Then /^I order the pizza$/ do
  step %{I select "Order this pizza"}
end

Given /^I add a topping name "(.*?)" with double set to "(.*?)"$/ do |name, double|
  step %{I select "Add toppings"}
  step %{I fill in "Name" with "#{name}"}
  if double == "true"
    check "Double order"
  end
  step %{I click the "Create" button} 
end

Then /^the topping named "(.*?)" with double order "(.*?)" should be added to order details$/ do |name, double|
  assert page.body.match(/Name.*Double order/m)
  assert page.body.match(/<td>#{name}<\/td>\s*<td>#{double}/m)
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

Then /^(I )?(O|o)rder a valid pizza$/ do |arg1, arg2|
  step "I order a pizza with the following information", table(%{
      | Name | Pizza 1   |  
      | Size | 30 inches |})
  #step %{the pizza named "Pizza 1" with the size of "30 inches", "0" toppings ordered and ordered status of "true" should have been ordered}
end

Given /^(I )?(C|c)reate(d)? a pizza but do not order it$/ do |arg1, arg2, arg3|
  step "I create an unordered pizza with the following information", table(%{
    | Name | Pizza Unordered |
    | Size | 25 inches  |})
  step %{I select "All orders"}
  #step %{the pizza named "Pizza Unordered" with the size of "25 inches", "0" toppings ordered and ordered status of "false" should have been ordered}
end