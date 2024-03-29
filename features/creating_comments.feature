Feature: Creating comments
	In order to update a ticket's progress
	As a user
	I want to leave comments

	Background:
		Given there are the following users:
			|	email				|	password	|
			|	user@tracker.com	|	password	|
		And I am signed in as them
		And there is a project called "Digg"
		And "user@tracker.com" can view the "Digg" project
		And "user@tracker.com" has created a ticket for this project:
			|	title				|	description					|
			|	Change a ticket's state	|	You should be able to create a comment	|
		Given I am on the projects page
		And I follow "Digg" within "#projects"

	Scenario: Creating a comment
		When I follow "Change a ticket's state"
		And I fill in "Text" with "Added a comment!"
		And I press "Create Comment"
		Then I should see "Comment has been created."
		Then I should see "Added a comment!" within "#comments"

	Scenario: Creating an invalid comment 
		When I follow "Change a ticket's state" 
		And I press "Create Comment" 
		Then I should see "Comment has not been created." 
		And I should see "Text can't be blank"
