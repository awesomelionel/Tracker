Feature: Editing Projects
	In order to update project information
	As a user
	I want to be able to do that through an interface

	Background: 
#		Given there are the following users:
#			|	email			|	password	|	admin	|
#			|admin@ticketee.com	|	password	|	true	|
#		And I am signed in as them
		Given there is a project called "Digg"
		And I am on the projects page
		When I follow "Digg"
		And I follow "Edit Project"

	Scenario: Updating a project
		And I fill in "Name" with "Digg beta"
		And I press "Update Project"
		Then I should see "Project has been updated."
		Then I should see "Digg beta"

	Scenario: Updating a project with invalid attributes is bad
		And I fill in "Name" with ""
		And I press "Update Project"
		Then I should see "Project has not been updated."
