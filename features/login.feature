Feature: Login to your pizzas

  In order to order a pizza
  As an existing user
  I want to login to intent pizza

  Background:
    Given I created a valid user

  Scenario: Login User Page should load successfully
    Given I am on the "/" page
    Then I should see "Login" on the page
      And I should see "Email" after "Login" on the page
      And I should see "Password" after "Email" on the page
  
  Scenario: Login a valid user
    Given I am on the "/" page
    And I fill in the following fields:
    | Email                 | testuser@validdomain.com |
    | Password              | testpassword             |
      And I click the "Login" button  
    Then I should be on the "account" page
      And I should see "testuser@validdomain.com" on the page
