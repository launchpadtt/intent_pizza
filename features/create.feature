Feature: Create a new user

  In order to view my pizzas
  As a new user
  I want to create a new user
  
  Scenario: Create a user page should load successfully
    Given I am on the "root" page
    When I select "Create a new user"
    Then I should see "Register" on the page
      And I should be on the "users/new" page    
  
  Scenario: Create a valid user
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | testuser@validdomain.com |
      | Password              | testpassword             |
      | Password confirmation | testpassword             |
      And I click the "Register" button    
    Then the user "testuser@validdomain.com" should be created successfully
      And I should be on the "account" page

  Scenario: Create a user with no login details
    Given I am on the "root" page
    When I select "Create a new user"
      And I click the "Register" button
    Then the user "" should not be created successfully
      And I should see "Email should look like an email address." on the page
      And I should see "Password is too short (minimum is 4 characters)" on the page
      And I should see "Password confirmation is too short (minimum is 4 characters)" on the page
      And I should see "Password doesn't match confirmation" on the page

  Scenario: Create a valid user with an e-mail address with invalid characters
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | A@b@c@example.com |
      | Password              | testpassword      |
      | Password confirmation | testpassword      |
      And I click the "Register" button
    Then the user "A@b@c@example.com" should not be created successfully
      And I should see "Email should look like an email address." on the page
