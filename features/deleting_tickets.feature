Feature: Deleting Tickets
	In order to remove tickets
	As a user
	I want to press delete and remove them easily

	Background:
		Given there is a project called "Digg"
		And that project has a ticket:
			| title				|	description						|
			| Fix User Login  	|	Add Authentication				|
		Given I am on the projects page
		When I follow "Digg"
		And I follow "Fix User Login"

	Scenario: Deleting a ticket
		When I follow "Delete Ticket"
		Then I should see "Ticket has been deleted."
		And I should see "Digg"

