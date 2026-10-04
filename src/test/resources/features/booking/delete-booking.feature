@delete
Feature: Testing delete API

  Background:
    * url baseUrl

  Scenario: create then delete

    Given path '/booking'
    And header 'Accept' = 'application/json'
    And header 'content-type' = 'application/json'
    And request read('classpath:data/booking/create-booking.json')
    When method POST
    Then status 200

    * print response
    * def bookingID = response.bookingid
    * print 'booking id', bookingID

    Given path '/auth'
    And header 'content-type' = 'application/json'
    And header 'Accept' = 'application/json'
    And request read('classpath:data/auth/login.json')
    When method POST
    Then status 200

    * def token = response.token

    Given path '/booking', bookingID
    And header Cookie = 'token=' + token
    When method DELETE
    Then status 201

    * print 'Booking deleted successfully:', bookingID