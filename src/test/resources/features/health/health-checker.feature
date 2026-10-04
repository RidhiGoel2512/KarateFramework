Feature: To check health of restful booker
	@health
	Scenario: Health checker
		Given url baseUrl + '/ping'
		When method GET
		Then status 201
				