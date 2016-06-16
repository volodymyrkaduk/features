Feature: test Base

	Scenario: Create new lead on Base

	Given I am on the Base login page

	When I enter valid user details to login

	Then Sales page is shown
	
	When I go to Leads page
	
	And Create new lead with all mandatory details set
		
	#Then I see new lead is created
	