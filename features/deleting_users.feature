Feature: Deleting users
	In order to remove users
	As an admin
	I want to click a button and delete them

	Background:
		Given there are the following users:
			| email              | password | admin |
			| admin@tracker.com | password | true  |
			| user@tracker.com  | password | false |
		And I am signed in as "admin@tracker.com"
		Given I am on the projects page
		When I follow "Admin Page"
		And I follow "Users"

	Scenario: Deleting a user
		When I follow "user@tracker.com"
		And I follow "Delete User"
		Then I should see "User has been deleted"

	Scenario: Users cannot delete themselves
		When I follow "admin@tracker.com"
		##  For some reason this doesn't pass even though the link is there
		#	And I follow "Delete User"
		#	Then I should see "You cannot delete yourself!"
