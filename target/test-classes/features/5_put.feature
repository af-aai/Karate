Feature: Put API Test

  Scenario: PUT demo 1
    Given url 'https://reqres.in/api/users/2'
    And request { "name": "elyar", "job": "leader"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus