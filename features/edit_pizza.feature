Feature: Edit pizza information

  In order to manage my pizza orders
  As an existing logged in user
  I want to edit unordered pizzas
  
  Background:
    Given I created a valid user
      And I logged in with the valid user
      And I created a pizza but did not order it
  
  Scenario: Show an existing unordered pizza order
    Given I select the "Show" Link for the valid pizza
    Then the pizza should be displayed with the following details:
      | Name | Pizza Unordered |
      | Size | 25 inches       |

  Scenario: Change the name of an existing unordered pizza order
    Given I select the "Edit" Link for the valid pizza
    When I fill in "Name" with "Pizza Unordered Edited"
      And I click the "Update" button
    Then the pizza should be displayed with the following details:
      | Name | Pizza Unordered Edited |
      | Size | 25 inches              |
    When I select "All orders"
      Then the pizza named "Pizza Unordered Edited" with the size of "25 inches", "0" toppings ordered and ordered status of "false" should have been ordered

  Scenario: Change the name of an existing unordered pizza order to a different one that already exists

  Scenario: Change the size of an existing unordered pizza order
    Given I select the "Edit" Link for the valid pizza
    When I fill in "Size" with "20 inches"
      And I click the "Update" button
    Then the pizza should be displayed with the following details:
      | Name | Pizza Unordered |
      | Size | 20 inches       |
    When I select "All orders"
      Then the pizza named "Pizza Unordered" with the size of "20 inches", "0" toppings ordered and ordered status of "false" should have been ordered

  # This testcase should be failing, I still can't figure out why
  Scenario: Remove an unordered pizza
    Given I select the "Remove" Link for the valid pizza
    Then the pizza named "Pizza Unordered" with the size of "25 inches", "0" toppings ordered and ordered status of "false" should NOT have been ordered
      And I should be on the "pizzas" page
      And I should NOT see the pizza details page

  Scenario: Add a topping
    Given I select the "Edit" Link for the valid pizza
    When I click the "Update" button
    Then the pizza should be displayed with the following details:
      | Name | Pizza Unordered |
      | Size | 25 inches       |
    When I add a topping name "Cheese" with double set to "true"
    Then the topping named "Cheese" with double order "true" should be added to order details
    When I select "All orders"
    Then the pizza named "Pizza Unordered" with the size of "25 inches", "1" toppings ordered and ordered status of "false" should have been ordered

  Scenario: Remove an existing topping
    Given I select the "Edit" Link for the valid pizza
    When I click the "Update" button
    Then the pizza should be displayed with the following details:
      | Name | Pizza Unordered |
      | Size | 25 inches       |
    When I add a topping name "Pineapple" with double set to "false"
    Then the topping named "Pineapple" with double order "false" should be added to order details
    When I select the Remove link for the "Pineapple" topping
    Then I should see the pizza details page
      And the topping named "Pineapple" should be NOT be on the page

  Scenario: No edit links for an ordered pizza
    Given I place another order for a pizza with the following information
      | Name | Pizza 1   |
      | Size | 30 inches |
    Then there should NOT be Show and Edit links for the pizza
