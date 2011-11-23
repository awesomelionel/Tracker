Feature: Viewing the Homepage
	As a user
	I want to visit key pages on the site
	So that I can successfully navigate around it

	Background: Homepage
		Given I am on the homepage
		Then I should see "Home"
		And I should see "About"
		And I should see "Contact"
		And I should see "Help"
		#And I should see "Projects"

	Scenario: Visiting the Home Page
		When I follow "Home"
		Then I should be on the home page

	Scenario: Visiting the About Page
		When I follow "About"
		Then I should be on the about page

	Scenario: Visiting the Contact Page
		When I follow "Contact"
		Then I should be on the contact page
	
	Scenario: Visiting the Help Page
		When I follow "Help"
		Then I should be on the help page
		
		#	Scenario: Visiting the Projects Page
		#		When I follow "Projects"
		#		Then I should be on the project page
			
