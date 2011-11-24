Feature: Viewing projects
	In order to assign tickets to a project
	As a user
	I want to be able to see a list of available projects

	Background: 
		Given there are the following users:
			|	email			|	password	|
			|	user@tracker.com	|	password	|
		And I am signed in as them
		And there is a project called "Digg"
		And there is a project called "Reddit"
		And "user@tracker.com" can view the "Digg" project

	Scenario: Listing all projects
		And I am on the projects page
		Then I should not see "Reddit"
		When I follow "Digg"
		Then I should see "Digg"
