Feature: Creating projects 
	In order to have projects to assign tickets to 
	As a user 
	I want to create them easily

	Background: Projects page
		Given there are the following users:
			|	email			 	|	password	| admin |
			|	admin@tracker.com	| 	password	| true 	|
		And I am signed in as them
		Given I am on the projects page
		When I follow "New Project"

	Scenario: Creating a project 
		When I fill in "Name" with "Digg" 
		And I press "Create Project"
		Then I should see "Project has been created."
		And I visit webpage for "Digg"
		And I should see "Digg"

	Scenario: Creating a project without a name
		When I press "Create Project"
		Then I should see "Project has not been created."
		And I should see "Name can't be blank"
