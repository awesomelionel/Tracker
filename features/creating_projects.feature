Feature: Creating projects 
	In order to have projects to assign tickets to 
	As a user 
	I want to create them easily

	Background: Projects page
		Given I am on the projects page

	Scenario: Creating a project 
		When I follow "New Project" 
		And I fill in "Name" with "Tracker" 
		And I press "Create Project"
		Then I should see "Project has been created."

