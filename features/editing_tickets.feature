Feature: Editing Tickets
	In order to alter the ticket information
	As a user
	I want a form to edit the tickets

	Background:
		Given there are the following users:
			|	email			 	|	password	|
			|	user@tracker.com	| 	password	|
		And I am signed in as them
		And there is a project called "Digg"
		And "user@tracker.com" can view the "Digg" project
		And "user@tracker.com" can edit tickets in the "Digg" project
		And "user@tracker.com" has created a ticket for this project:
			| title				|	description						|
			| Fix User Login  	|	Add Authentication				|
		Given I am on the projects page
		When I follow "Digg"
		And I follow "Fix User Login"
		When I follow "Edit Ticket"

	Scenario: Updating a ticket
		When I fill in "Title" with "Fix User Login NOW"
		And I press "Update Ticket"
		Then I should see "Ticket has been updated."
		And I should see "Fix User Login NOW" within "#ticket h2"
		#But I should not see "Fix User Login" 

	Scenario: Updating ticket with invalid attributes
		When I fill in "Title" with ""
		And I press "Update Ticket"
		Then I should see "Ticket has not been updated."


