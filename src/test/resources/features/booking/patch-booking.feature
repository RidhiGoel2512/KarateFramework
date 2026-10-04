@patch 
Feature: Patch

	Background:
	* url baseUrl
	
	Scenario: Create and patch first name
		Given path '/booking'
		And header 'Content-Type' = 'application/json'
		And header 'Accept' = 'application/json'
		And request read ('classpath:data/booking/create-booking.json')
		When method POST
		Then status 200
		
		* print response
		* def bookingID = response.bookingid
		* print 'booking id', bookingID
		
		Given path '/auth'
		And request read('classpath:data/auth/login.json')
		When method POST
		Then status 200
		
		* def token = response.token
		
		Given path '/booking', bookingID

And header 'Content-Type' = 'application/json'
And header 'Accept' = 'application/json'
And header Cookie = 'token=' + token

And request read('classpath:data/booking/patch-booking.json')

When method PATCH
Then status 200

And match response.firstname == 'RidhiPatched'

* print response
		

