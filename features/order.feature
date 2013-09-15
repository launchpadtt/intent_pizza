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
    Then the pizza named "Pizza 1" with the size of "30 inches" should have been ordered
  
  Scenario: Order a pizza with no information
    Given I order a pizza with the following information
      | Name |  |
      | Size |  |
    Then no pizza should have been ordered

  Scenario: Order a pizza with no name
    Given I order a pizza with the following information
      | Name |           |
      | Size | 20 inches |
    Then no pizza should have been ordered

  Scenario: Order a pizza with no size
    Given I order a pizza with the following information
      | Name | Pizza with no size |
      | Size |                    |
    Then no pizza should have been ordered

  Scenario: Order a pizza with the same name as an existing pizza order
    Given I order a pizza with the following information
      | Name | Pizza Same |
      | Size | 30 inches  |
    Then I order a pizza with the following information
      | Name | Pizza Same |
      | Size | 30 inches  |

  Scenario: Order a pizza with toppings

  Scenario: Create a pizza but do not order it