Feature: Order a pizza

  In order to order a pizza
  As an existing logged in user
  I want to order a pizza
  
  Background:
    Given I created a valid user
      And I logged in with the valid user
  
  Scenario: Order a valid pizza
    Given I order a pizza with the following information
      | Name | Pizza 1   |  
      | Size | 30 inches |
    Then the pizza named "Pizza 1" with the size of "30 inches", "0" toppings ordered and ordered status of "true" should have been ordered
  
  Scenario: Order a pizza with no information
    Given I order a pizza with the following information
      | Name |  |
      | Size |  |
    Then the pizza named "" with the size of "", "0" toppings ordered and ordered status of "true" should NOT have been ordered

  Scenario: Order a pizza with no name
    Given I order a pizza with the following information
      | Name |           |
      | Size | 20 inches |
    Then the pizza named "" with the size of "20 inches", "0" toppings ordered and ordered status of "true" should NOT have been ordered

  Scenario: Order a pizza with no size
    Given I order a pizza with the following information
      | Name | Pizza with no size |
      | Size |                    |
    Then the pizza named "Pizza with no size" with the size of "", "0" toppings ordered and ordered status of "true" should NOT have been ordered

  Scenario: Order a pizza with the same name as an existing pizza order
    Given I order a pizza with the following information
      | Name | Pizza Same |
      | Size | 30 inches  |
      And I place another order for a pizza with the following information
        | Name | Pizza Same |
        | Size | 30 inches  |
    Then I should NOT see two pizzas named "Pizza Same" with a size of "30 inches", "0" toppings ordered and ordered status of "true"

  Scenario: Create a pizza but do not order it
    Given I create an unordered pizza with the following information
      | Name | Pizza Unordered |
      | Size | 25 inches  |
      And I select "All orders"
    Then the pizza named "Pizza Unordered" with the size of "25 inches", "0" toppings ordered and ordered status of "false" should have been ordered

  Scenario: Order a pizza with toppings
    Given I create an unordered pizza with the following information
      | Name | Pizza with toppings |
      | Size | 15 inches           |
    When I add a topping name "Anchovies" with double set to "true"
    Then the topping named "Anchovies" with double order "true" should be added to order details
    When I select "All orders"
    Then the pizza named "Pizza with toppings" with the size of "15 inches", "1" toppings ordered and ordered status of "false" should have been ordered
      
  Scenario: One user should not be able to see another users pizzas
    Given I order a valid pizza
      And I login with a different user after having already logged in
      And I select "Show ordered pizzas"
    Then the pizza named "Pizza 1" with the size of "30 inches", "0" toppings ordered and ordered status of "true" should NOT have been ordered
      