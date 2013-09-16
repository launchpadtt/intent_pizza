Feature: Edit Profile Information

  In order to manage my user information
  As an existing user
  I want to edit my user profile information
  
  Background:
    Given I created a valid user
      And I logged in with the valid user
  
  Scenario: Don't change any details and go back to profile
    Given I select "Edit"
      And I select "My Profile"
    Then I should be on the "account" page
      And I should see "Login: testuser@validdomain.com" on the page

  Scenario: Change the email
    Given I edit the profile with the following fields
        | Email | testuseredited@validdomain.com |
    Then I should see "Login: testuseredited@validdomain.com" on the page

  Scenario: Change the password
    Given I edit the profile with the following fields
        | Change password       | newpassword |
        | Password confirmation | newpassword |
    Then I should be on the "account" page

  Scenario: Use different passwords in password and confirmation
    Given I edit the profile with the following fields
        | Change password       | newpassword1 |
        | Password confirmation | newpassword2 |
    Then I should see "Password doesn't match confirmation" on the page

  Scenario: Change username to an invalid email
    Given I edit the profile with the following fields
        | Email | A@b@c@example.com |
    Then I should see "Email should look like an email address." on the page
    When I select "My Profile"
    Then I should see "Login: testuser@validdomain.com" on the page

  Scenario: Change username to email that is too long
    Given I edit the profile with the following fields
        | Email | thisemailaddressisreallylong.itissupposedtobelongerthantwohundredandfiftyfourcharactersinlength.atthispointithasonlyreached_onehundredandfiftytwocharactersbutifonetalksforlongenough_eventuallyonereachestherequiredlength-almosttherejustafewmore01234567890@test.com |
    Then I should see "Email is too long (maximum is 100 characters)" on the page
    When I select "My Profile"
    Then I should see "Login: testuser@validdomain.com" on the page

  Scenario: Change password to password that is too short
    Given I edit the profile with the following fields
        | Change password       | abc |
        | Password confirmation | abc |
    Then I should see "Password is too short (minimum is 4 characters)" on the page
      And I should see "Password confirmation is too short (minimum is 4 characters)" on the page

  Scenario: Change password to password that is too long
    Given I edit the profile with the following fields
        | Change password       | this-password-is-supposed-to-be-really-really-long.it's-unclear-just-how-long-its-supposed-to-be-since-i-dont-know-the-limit-on-length-that-a-password-is-supposed-to-have--in-rails-but-i'll-aim-for-255-since-that's-fairly-reasonable-and-theres-not-much-more-that-needs-to-be-done-besides-that |
        | Password confirmation | this-password-is-supposed-to-be-really-really-long.it's-unclear-just-how-long-its-supposed-to-be-since-i-dont-know-the-limit-on-length-that-a-password-is-supposed-to-have--in-rails-but-i'll-aim-for-255-since-that's-fairly-reasonable-and-theres-not-much-more-that-needs-to-be-done-besides-that |
    Then I should see "Password is too long" on the page
      And I should see "Password confirmation is too long" on the page

  Scenario: Change username to email that is too short
    Given I edit the profile with the following fields
        | Email | t@e.m |
    Then I should see "Email should look like an email address." on the page
    When I select "My Profile"
    Then I should see "Login: testuser@validdomain.com" on the page
  