Feature: Editing a user
  In order to change a user's details
  As an admin
  I want to be able to modify them through the backend

Background:
  Given there are the following users:
    | email              | password | admin | 
    | admin@tracker.com | password | true  |
  And I am signed in as them

  Given there are the following users:
    | email             | password |
    | user@tracker.com | password |
  Given I am on the projects page
  When I follow "Admin Page"
  And I follow "Users"
  And I follow "user@tracker.com"
  And I follow "Edit User"
       
Scenario: Updating a user's details
  When I fill in "Email" with "newguy@tracker.com"
  And I press "Update User"
  Then I should see "User has been updated."
  And I should see "newguy@tracker.com"
  And I should not see "user@tracker.com"
       
Scenario: Toggling a user's admin ability
  When I check "Is an admin?"
  And I press "Update User"
  Then I should see "User has been updated."
  And I should see "user@tracker.com (Admin)"

Scenario: Updating with an invalid email fails
  When I fill in "Email" with "fakefakefake"
  And I press "Update User"
  Then I should see "User has not been updated."
  And I should see "Email is invalid"
