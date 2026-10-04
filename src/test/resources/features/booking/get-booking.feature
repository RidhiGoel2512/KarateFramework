@test2
Feature: testing post and get flow
	
	Background:
		* url baseUrl
		
	Scenario: get booking by booking ID
		Given path '/booking'
		And request read ('classpath:data/booking/create-booking.json')
		And header Content-Type = 'application/json'
		And header Accept = 'application/json'
		When method POST
		Then status 200
		And match response.booking.firstname == "Ridhi1"
		* def bookingId = response.bookingid 
		* print '===================' , bookingId
		
		 # Get booking using dynamically generated ID
    Given path '/booking', bookingId
    And header Accept = 'application/json'
    When method GET
    Then status 200

    * print 'Booking Response:', response