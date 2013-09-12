Feature: Create a new user

  In order to order a pizza
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
      #And I should be on the "users/new" page    

  Scenario: Create a user with an e-mail address with invalid characters
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | A@b@c@example.com |
      | Password              | testpassword      |
      | Password confirmation | testpassword      |
      And I click the "Register" button
    Then the user "A@b@c@example.com" should not be created successfully
      And I should see "Email should look like an email address." on the page
      #And I should be on the "users/new" page    

  Scenario: Create a user with no e-mail address
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 |                |
      | Password              | noemailaddress |
      | Password confirmation | noemailaddress |
      And I click the "Register" button
    Then the user "" should not be created successfully
      And I should see "Email should look like an email address." on the page
      #And I should be on the "users/new" page    

  Scenario: Create a user with no password
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | no.valid.email.address@test.com |
      | Password              |                                 |
      | Password confirmation |                                 |
      And I click the "Register" button
    Then the user "no.valid.email.address@test.com" should not be created successfully
      And I should see "Password is too short (minimum is 4 characters)" on the page
      And I should see "Password confirmation is too short (minimum is 4 characters)" on the page
      #And I should be on the "users/new" page    


  Scenario: Create a user with a password that is the same as the e-mail address
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | sameaspassword@test.com |
      | Password              | sameaspassword@test.com |
      | Password confirmation | sameaspassword@test.com |
      And I click the "Register" button
    Then the user "sameaspassword@test.com" should not be created successfully
      And I should see "The password should not be the same as the e-mail address" on the page
      #And I should be on the "users/new" page    

  Scenario: Create a user with an e-mail address that is too long
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | thisemailaddressisreallylong.itissupposedtobelongerthantwohundredandfiftyfourcharactersinlength.atthispointithasonlyreached_onehundredandfiftytwocharactersbutifonetalksforlongenough_eventuallyonereachestherequiredlength-almosttherejustafewmore01234567890@test.com |
      | Password              | testpassword                                                                                                                                                                                                                                                            |
      | Password confirmation | testpassword                                                                                                                                                                                                                                                            |
      And I click the "Register" button
    Then the user "thisemailaddressisreallylong.itissupposedtobelongerthantwohundredandfiftyfourcharactersinlength.atthispointithasonlyreached_onehundredandfiftytwocharactersbutifonetalksforlongenough_eventuallyonereachestherequiredlength-almosttherejustafewmore01234567890@test.com" should not be created successfully
      And I should see "Email is too long (maximum is 100 characters)" on the page
      #And I should be on the "users/new" page    

  Scenario: Create a user with a password that is too long
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | testing-long-password@test.com |
      | Password              | this-password-is-supposed-to-be-really-really-long.it's-unclear-just-how-long-its-supposed-to-be-since-i-dont-know-the-limit-on-length-that-a-password-is-supposed-to-have--in-rails-but-i'll-aim-for-255-since-that's-fairly-reasonable-and-theres-not-much-more-that-needs-to-be-done-besides-that |
      | Password confirmation | this-password-is-supposed-to-be-really-really-long.it's-unclear-just-how-long-its-supposed-to-be-since-i-dont-know-the-limit-on-length-that-a-password-is-supposed-to-have--in-rails-but-i'll-aim-for-255-since-that's-fairly-reasonable-and-theres-not-much-more-that-needs-to-be-done-besides-that |
      And I click the "Register" button
    Then the user "testing-long-password@test.com" should not be created successfully
      And I should see "Password is too long (maximum is 100 characters)" on the page
      #And I should be on the "users/new" page    

  Scenario: Create a user with an e-mail address that is too short
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | t@e.m |
      | Password              | testpassword |
      | Password confirmation | testpassword |
      And I click the "Register" button
    Then the user "t@e.m" should not be created successfully
      And I should see "Email should look like an email address." on the page
      #And I should be on the "users/new" page 

  Scenario: Create a user with a password that is too short
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | password.is.too.short@test.com |
      | Password              | abc |
      | Password confirmation | abc |
      And I click the "Register" button
    Then the user "password.is.too.short@test.com" should not be created successfully
      And I should see "Password is too short (minimum is 4 characters)" on the page
      And I should see "Password confirmation is too short (minimum is 4 characters)" on the page
      #And I should be on the "users/new" page 

  Scenario: Create a user where the password and confirmation are different
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | password.and.confirmation.different@test.com |
      | Password              | testpassword                                 |
      | Password confirmation | testpasswordconfirmation                     |
      And I click the "Register" button
    Then the user "password.and.confirmation.different@test.com" should not be created successfully
      And I should see "Password doesn't match confirmation" on the page
      #And I should be on the "users/new" page 

  Scenario: Visiting create a new user page after having already created a new user
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | first_user@test.com |
      | Password              | testpassword        |
      | Password confirmation | testpassword        |
      And I click the "Register" button
      And I visit "/" page
      And I select "Create a new user"
    Then I should be on the "users/new" page 

  Scenario: Create a user with the same e-mail address twice
    Given I am on the "root" page
    When I select "Create a new user"
      And I fill in the following fields:
      | Email                 | first_user@test.com |
      | Password              | testpassword        |
      | Password confirmation | testpassword        |
      And I click the "Register" button
      And I visit "/" page
      And I select "Create a new user"
      And I fill in the following fields:
      | Email                 | first_user@test.com |
      | Password              | testpassword        |
      | Password confirmation | testpassword        |
      And I click the "Register" button
    Then I should see "Email has already been taken" on the page
    