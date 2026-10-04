Feature: Authentication
	@authentication1
	Scenario: Generation of authentication token
		Given url baseUrl + '/auth'
		And request read('classpath:data/auth/login.json')
		When method POST
		Then status 200
		
		* def tokenAuth = response.token
		* print tokenAuth