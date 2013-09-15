Given /^I select the "(.*?)" Link for the valid pizza$/ do |link|
  within(:xpath, "//tr/td[position() = 1 and text() = 'Pizza Unordered']/..") do
    click_link(link)
  end
end
