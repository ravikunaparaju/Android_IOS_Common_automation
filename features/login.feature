@reinstall
Feature: User should be logged in to the application by entering valid login details or selecting "Use as guest" in Launch screen
    
    
	Scenario: When user enters valid user name and password details and taps on login button, Main map view screen should be displayed.

    	Given user navigates to login screen
    	When user enters valid User name, Password and click on Login button.
    	Then app should display Main Map View screen
	
    
	Scenario: When user enters invalid user name and password details and taps on login button error message should be displayed.

    	Given user navigates to login screen
    	When user enters invalid User name, Password details and click on Login button.
    	Then app should display error message for invalid login details

    
    Scenario: As a guest user, when I tap on "Use as guest" link in launch screen, I should see Main map view screen

		Given user launches the app first time
		When user taps on Use as guest text
		Then user should see Main map view screen