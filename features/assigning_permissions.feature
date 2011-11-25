Feature: Assigning permissions
	In order to set up users with the correct permissions
	As an admin 
	I want to check all the boxes

	Background:
		Given there are the following users:
			| email              | password | admin |
			| admin@tracker.com | password | true  |
		And I am signed in as them
		And there are the following users:
			| email             | password |
			| user@tracker.com | password |
		And there is a project called "Digg"
		And "user@tracker.com" has created a ticket for this project:
			| title  | description       |
			| Shiny! | Eye-blindingly so |

		When I follow "Projects"
		When I follow "Admin Page"
		And I follow "Users"
		And I follow "user@tracker.com"
		And I follow "Permissions"

	Scenario: Viewing a project
		When I check "View" for "Digg"
		And I press "Update"
		And I follow "Sign out"

		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		Then I should see "Digg"

	Scenario: Creating tickets for a project
		When I check "View" for "Digg"
		When I check "Create tickets" for "Digg"
		And I press "Update"
		And I follow "Sign out"

		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "New Ticket"
		And I fill in "Title" with "Shiny!"
		And I fill in "Description" with "Make it so!"
		And I press "Create"
		Then I should see "Ticket has been created."

	Scenario: Updating a ticket for a project
		When I check "View" for "Digg"
		And I check "Edit tickets" for "Digg"
		And I press "Update"
		And I follow "Sign out"

		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		And I follow "Edit"
		And I fill in "Title" with "Really shiny!"
		And I press "Update Ticket"
		Then I should see "Ticket has been updated"

	Scenario: Deleting a ticket for a project
		When I check "View" for "Digg"
		And I check "Delete tickets" for "Digg"
		And I press "Update"
		And I follow "Sign out"

		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		And I follow "Delete"
		Then I should see "Ticket has been deleted."

