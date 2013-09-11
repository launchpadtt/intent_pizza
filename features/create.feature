Feature: Create a new user

  In order to view my pizzas
  As a new user
  I want to create a new user
  
  Scenario: Create a user page should load successfully
    Given I am on the "root" page
    When I select "Create a new user"
    Then I should be on the "Register" page
  
  Scenario: Create a valid user
    Given I am on the "root" page
    When I select "Create a new user"
    Then I fill in the following fields:
    | Email                    | Password     | Password confirmation |
    | testuser@validdomain.com | testpassword | testpassword          |
    
    Then the user should be created successfully