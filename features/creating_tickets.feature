Feature: Creating Tickets
	In order to create tickets for projects
	As a user
	I want to be able to select a project and do that

	Background:
		Given there is a project called "Reddit"
		And I am on the projects page
		When I follow "Reddit"
		And I follow "New Ticket"

	Scenario: Creating a ticket
		When I fill in "Title" with "Need more upvotes"
		And I fill in "Description" with "I need more karma"
		And I press "Create Ticket"
		Then I should see "Ticket has been created."

	Scenario: Creating a ticket without valid attributes
		When I press "Create Ticket"
		Then I should see "Ticket has not been created."
		And I should see "Title can't be blank"
		And I should see "Description can't be blank"

	Scenario: Description must be longer than 10 characters
		When I fill in "Title" with "Need more upvotes"
		And I fill in "Description" with "MOAR"
		And I press "Create Ticket"
		Then I should see "Ticket has not been created."
		And I should see "Description is too short"

