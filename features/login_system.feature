Feature: create a secure login system for challenge organizers

  As a challenge organizer
  So that my challenges can only be created, read, updated, and destroyed (CRUD) by me
  I want a secure login system that only registered users can access

Background: accounts have been added to database

	Given the following accounts exist:
	| email            | password       | workbench_id | first_name | last_name |
    | test@gmail.com   | testingitright | 1992         | Testing    | Rocks     |

    And I am on the Chalearn sign_in page
    And I am not signed in

Scenario: given the right email and right password
  When I input "test@gmail.com" as email
  And I input "testingitright" as password
  And I click on the sign_in button
  Then I should be on the Chalearn home page
  And I should see "Welcome back, Testing Rocks!" as message

Scenario: given the right email and wrong password
  When I input "test@gmail.com" as email
  And I put "nottestingitright" as password
  And I click on the sign_in button
  Then I should be on the Chalearn sign_in page
  And I should see "There is not a match between your email and password." as message

Scenario: given the wrong email and right password
  When I input "bug@gmail.com" as email
  And I put "testingitright" as password
  And I click on the sign_in button
  Then I should be on the Chalearn sign_in page
  And I should see "There is not a match between your email and password." as message

Scenario: given the wrong email and wrong password
  When I input "bug@gmail.com" as email
  And I put "nottestingitright" as password
  And I click on the sign_in button
  Then I should be on the Chalearn sign_in page
  And I should see "There is not a match between your email and password." as message

Scenario: given the forgot_your_password? button is clicked
  When I click on the forgot_your_password? button
  Then I should be on the password_new page
  And I should see an email field

Scenario: given a user is signing up
  When I click on the sign_up button
  Then I should see an email field
  And I should see a password field
  And I should see a workbench_id field
  And I should see a first_name field
  And I should see a last_name field
