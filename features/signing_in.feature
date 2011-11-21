Feature: Signing in
	In order to use the application
	As a user
	I want to be able to sign in

	Scenario: Signing in via form
		Given there are the following users:
			|	email			 	|	password	|
			|	user@tracker.com	| 	password	|
		And I am on the homepage
		When I follow "Sign in"
		And I fill in "Email" with "user@tracker.com"
		And I fill in "Password" with "password"
		And I press "Sign in"
		Then I should see "Signed in successfully."
