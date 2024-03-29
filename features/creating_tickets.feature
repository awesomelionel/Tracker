Feature: Creating Tickets
	In order to create tickets for projects
	As a user
	I want to be able to select a project and do that

	Background:
		Given there is a project called "Reddit"
		And there are the following users:
			|	email			 	|	password	|
			|	user@tracker.com	| 	password	|
		And "user@tracker.com" can view the "Reddit" project
		And "user@tracker.com" can create tickets in the "Reddit" project
		And I am signed in as them
		And I am on the projects page
		When I follow "Reddit"
		And I follow "New Ticket"

	Scenario: Creating a ticket
		When I fill in "Title" with "Need more upvotes"
		And I fill in "Description" with "I need more karma"
		And I press "Create Ticket"
		Then I should see "Ticket has been created."
		Then I should see "Need more upvotes" within "#ticket h2"
		Then I should see "Created by user@tracker.com"

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

	Scenario: Creating a ticket with an attachment 
		When I fill in "Title" with "Add documentation for blink tag" 
		And I fill in "Description" with "The blink tag has a speed attribute" 
		And I attach the file "spec/fixtures/speed.txt" to "File" 
		And I press "Create Ticket" 
		Then I should see "Ticket has been created." 
		Then I should see "speed.txt" within "#ticket .asset"
