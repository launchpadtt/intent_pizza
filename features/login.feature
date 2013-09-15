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
    Given I login with the following information:
      | Email                 | testuser@validdomain.com |
      | Password              | testpassword             |
    Then I should be logged in with the user "testuser@validdomain.com"

  Scenario: Login with a different user after already having logged in
  	Given I create a user with the following information
  	  | Email                 | secondtestuser@validdomain.com |
  	  | Password              | secondtestpassword             |
  	  | Password confirmation | secondtestpassword             |
  	  And I login with the following information:
  	    | Email    | testuser@validdomain.com |
  	    | Password | testpassword             |
  	Then I should be logged in with the user "secondtestuser@validdomain.com"

  Scenario: Login a user with no login details
    Given I login with the following information:
  	  | Email    |  |
  	  | Password |  |
    Then I should see "You did not provide any details for authentication." on the page

  Scenario: Login a user with no password
    Given I login with the following information:
      | Email                 | no-password@validdomain.com |
      | Password              |                             |
    Then I should see "Password cannot be blank" on the page
      #And I should be on the "/" page

  Scenario: Login a user with no e-mail address
    Given I login with the following information:
      | Email                 |                     |
      | Password              | testpasswordnoemail |
    Then I should see "Email cannot be blank" on the page
      #And I should be on the "/" page

  Scenario: Login a user with a user that doesn't exist
    Given I login with the following information:
      | Email                 | nonexistantuser@validdommain.com |
      | Password              | testpasswordnouser               |
    Then I should see "Email is not valid" on the page
      #And I should be on the "/" page

  Scenario: Login a user with an invalid e-mail address
    Given I login with the following information:
      | Email                 | A@b@c@example.com   |
      | Password              | testpasswordinvalid |
    Then I should see "Email is not valid" on the page
      #And I should be on the "/" page - DONE - Cucumber
      
  Scenario: Login a user with an e-mail address that is too long
    Given I login with the following information:
      | Email                 | thisemailaddressisreallylong.itissupposedtobelongerthantwohundredandfiftyfourcharactersinlength.atthispointithasonlyreached_onehundredandfiftytwocharactersbutifonetalksforlongenough_eventuallyonereachestherequiredlength-almosttherejustafewmore01234567890@test.com |
      | Password              | testpasswordemaillong                                                                                                                                                                                                                                                   |
    Then I should see "Email is not valid" on the page
      #And I should be on the "/" page
      
  Scenario: Login a user with a password that is too long
    Given I login with the following information:
      | Email                 | passwordtoolong@validdommain.com |
      | Password              | this-password-is-supposed-to-be-really-really-long.it's-unclear-just-how-long-its-supposed-to-be-since-i-dont-know-the-limit-on-length-that-a-password-is-supposed-to-have--in-rails-but-i'll-aim-for-255-since-that's-fairly-reasonable-and-theres-not-much-more-that-needs-to-be-done-besides-that |
    Then I should see "Email is not valid" on the page
      #And I should be on the "/" page
