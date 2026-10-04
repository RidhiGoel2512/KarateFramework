@update

Feature: Update

	Background:

    * print 'BASE URL =', baseUrl
    * url baseUrl
			
	Scenario: Update an existing booking
		* def booking = call read('classpath:features/booking/create-booking.feature')
		* def bookingID = booking.bookingId
		* def auth = call read('classpath:features/auth/authentication.feature')
		* def token = auth.tokenAuth
		* print '==================', token
		
		
		Given path '/booking', bookingID
		And header Cookie = 'token=' + token
		And header 'Content-type' = 'application/json'
		And header 'Accept' = 'application/json'
		And request read('classpath:data/booking/update-booking.json')
		When method PUT
		Then status 200
		* print response
		And match response.firstname == 'RidhiUpdated'
		