Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@tracker.com"
	When I follow "Projects"
	Then I should see the "Create New Project" link
	And I should see "My Sample Project"

