@data
Feature: data driven testing dem

	Background:
	* url baseUrl
	* def headers = call read('classpath:utils/commn.js')
	
	Scenario Outline: data driven demo scenario for '<firstname>'
	* print 'Environment:', karate.env
	* print 'Base URL:', baseUrl
	* def firstname = '<firstname>'
	* def lastname = '<lastname>'
	* def totalprice = '<totalprice>'
	* def depositpaid = '<depositpaid>'
	* def checkin = '<checkin>'
	* def checkout = '<checkout>'
	* def additionalneeds = '<additionalneeds>'
	
	Given path '/booking'
	And headers headers.jsonHeaders
	And request read('classpath:data/booking/create-booking-template.json')
	When method POST
	Then status 200
	And match response == read('classpath:data/booking/create-booking-schema.json')
	And match response.booking.firstname == firstname
	And match response.booking.lastname == lastname
	And match response.booking.totalprice == totalprice
	And match response.booking.depositpaid == depositpaid
	#And match response.booking.additionalneeds == '#string'
	
	 Examples:
            | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
            | Ridhi     | Goel     | 150        | true        | 2026-10-10 | 2026-10-15 | Breakfast       |
            | Rahul     | Sharma   | 200        | false       | 2026-11-01 | 2026-11-05 | Lunch           |
            | Amit      | Kumar    | 300        | true        | 2026-12-01 | 2026-12-07 | Dinner          |
	
	