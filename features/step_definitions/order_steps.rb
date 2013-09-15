Given /^I order a pizza with the following information$/ do |fields|
  step %{I start to order a pizza with the following information}, fields
  step %{The unordered pizza should be created}, fields
  step %{I order the pizza}
end

Given /^I start to order a pizza with the following information$/ do |fields|
  step %{I select "Order a pizza"}
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

Then /^the pizza named "(.*?)" with the size of "(.*?)" should have been ordered$/ do |pizza_name, pizza_size|
  pending
end

Then /^no pizza should have been ordered$/ do
  pending # express the regexp above with the code you wish you had
end

