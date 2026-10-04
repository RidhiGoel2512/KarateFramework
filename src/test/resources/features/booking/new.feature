@new
Feature: Update

Background:
    * print 'BASE URL =', baseUrl
    * url baseUrl

Scenario: Test config

    Given path '/booking'
    When method GET
    Then status 200