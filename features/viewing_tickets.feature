Feature: Viewing tickets
	In order to view the tickets for a project
	As a user
	I want to see them on that project's page

	Background:
		Given there are the following users:
			|	email			 	|	password	|
			|	user@tracker.com	| 	password	|
		And there is a project called "Digg"
		And "user@tracker.com" has created a ticket for this project:
			| title				|	description						|
			| Fix User Login  	|	Add Authentication				|
		And there is a project called "Reddit"
		And "user@tracker.com" has created a ticket for this project:
			| title					| 	description		|
			| Standards compliance	|	Isn't a joke.	|		
		And I am on the projects page

	Scenario: Viewing tickets for a given project
		When I follow "Digg"
		Then I should see "Fix User Login"
		And I should not see "Standards compliance"
		When I follow "Fix User Login"
		Then I should see "Add Authentication"
		And I should see "Fix User Login"

		When I follow "Projects"
		And I follow "Reddit"
		Then I should see "Standards compliance" 
		And I should not see "Fix User Login"
		When I follow "Standards compliance"
		Then I should see "Isn't a joke."
		And I should see "Standards compliance"
