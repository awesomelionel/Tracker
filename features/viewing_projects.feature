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

	Scenario: Listing all projects
		Given there is a project called "Digg"
		And I am on the projects page
		When I follow "Digg"
		Then I should see "Digg"
