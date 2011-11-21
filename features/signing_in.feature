Feature: Signing in
	In order to use the application
	As a user
	I want to be able to sign in

	Scenario: Signing in via form
		Given there are the following users:
			|	email			 	|	password	|
			|	user@tracker.com	| 	password	|
		And I am signed in as them
