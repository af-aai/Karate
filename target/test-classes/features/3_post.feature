Feature: Post API Test
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'


# Post scenario with Background
  Scenario: Post demo 2
    Given path '/users'
    And request { "name": "elyar", "job": "leader"}
    When method post
    Then status 201

  # Post with response assertion
  Scenario: Post demo 3
    Given path '/users'
    And request { "name": "elyar", "job": "leader"}
    When method post
    Then status 201
    And match response == {"name": "elyar", "job": "leader","id": "#string","createdAt": "#ignore"}

