Feature: Hidden Links
	In order to clean up the user experience 
	As the system
	I want to hide links from users who can't act on them

	Background:
		Given there are the following users:
			| email              | password | admin |
			| user@tracker.com  | password | false | 
			| admin@tracker.com | password | true  |
		And there is a project called "Digg"
		And "user@tracker.com" has created a ticket for this project:
			| title  | description        |
			| Shiny! | My eyes! My eyes!  |
		And "user@tracker.com" can view the "Digg" project

		#NEW PROJECT
	Scenario: New project link is hidden for non-signed-in users
		Given I am on the homepage 
		Then I should not see the "Projects" link

	Scenario: New project link is hidden for signed-in users
		Given I am signed in as "user@tracker.com"
		And I am on the projects page
		Then I should not see the "Create New Project" link

	Scenario: New project link is shown to admins
		Given I am signed in as "admin@tracker.com"
		And I am on the projects page
		Then I should see the "Create New Project" link

		#EDIT PROJECT
		#	Scenario: Edit project link is hidden for non-signed-in users
		#		Given I am on the projects page
		#		When I follow "TextMate 2"
		#		Then I should not see the "Edit Project" link

	Scenario: Edit project link is hidden for signed-in users
		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		And I follow "Digg"
		Then I should not see the "Edit Project" link

	Scenario: Edit project link is shown to admins
		Given I am signed in as "admin@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should see the "Edit Project" link

		#DELELTE PROJECT
		#	Scenario: Delete project link is hidden for non-signed-in users
		#		Given I am on the homepage
		#		When I follow "TextMate 2"
		#		Then I should not see the "Delete Project" link

	Scenario: Delete project link is hidden for signed-in users
		Given I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should not see the "Delete Project" link

	Scenario: Delete project link is shown to admins
		Given I am signed in as "admin@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should see the "Delete Project" link

#
# 	Hidding Links based on Permission
# 	NEW TICKET LINK
	Scenario: New ticket link is shown to a user with permission
		Given "user@tracker.com" can view the "Digg" project
		And "user@tracker.com" can create tickets on the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should see "New Ticket"

	Scenario: New ticket link is hidden from a user without permission
		Given "user@tracker.com" can view the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should not see the "New Ticket" link

	Scenario: New ticket link is shown to admins
		Given I am signed in as "admin@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		Then I should see the "New Ticket" link

#	EDIT TICKET LINK

	Scenario: Edit ticket link is shown to a user with permission
		Given "user@tracker.com" can view the "Digg" project
		And "user@tracker.com" can edit tickets on the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should see the "Edit" link

	Scenario: Edit ticket link is hidden from a user without permission
		Given "user@tracker.com" can view the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should not see the "Edit" link

	Scenario: Edit ticket link is shown to admins
		Given I am signed in as "admin@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should see the "Edit" link

#DELETING TICKETS

	Scenario: Delete ticket link is shown to a user with permission
		Given "user@tracker.com" can view the "Digg" project
		And "user@tracker.com" can delete tickets in the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should see "Delete"

	Scenario: Delete ticket link is hidden from a user without permission
		Given "user@tracker.com" can view the "Digg" project
		And I am signed in as "user@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should not see the "Delete" link

	Scenario: Delete ticket link is shown to admins
		Given I am signed in as "admin@tracker.com"
		When I follow "Projects"
		When I follow "Digg"
		And I follow "Shiny!"
		Then I should see the "Delete" link


