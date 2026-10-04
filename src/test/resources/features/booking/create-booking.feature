@test1
Feature: Create Booking

Background:
* url baseUrl
  Scenario: Create a new booking
    Given path '/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request read('classpath:data/booking/create-booking.json')
    When method POST
    Then status 200
    * def bookingId = response.bookingid
    * print 'booking id is', bookingId