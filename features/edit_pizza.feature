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

  Scenario: Change the size of an existing unordered pizza order

  Scenario: Remove an unordered pizza

  Scenario: Add a topping

  Scenario: Remove an existing topping - (this fails, there's no template)
